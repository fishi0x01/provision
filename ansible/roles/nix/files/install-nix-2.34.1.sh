#!/bin/sh

# This script installs the Nix package manager on your system by
# downloading a binary distribution and running its installer script
# (which in turn creates and populates /nix).

{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}

umask 0022

tmpDir="$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX || \
          oops "Can't create temporary directory for downloading the Nix binary tarball")"
cleanup() {
    rm -rf "$tmpDir"
}
trap cleanup EXIT INT QUIT TERM

require_util() {
    command -v "$1" > /dev/null 2>&1 ||
        oops "you do not have '$1' installed, which I need to $2"
}

case "$(uname -s).$(uname -m)" in
    Linux.x86_64)
        hash=92fc64a0740353215dec590508b9008cc8bd8e7c3d2b387a65da28146a78442f
        path=x5fmdlsqv2q3r4d4hg1kdy68mc1bzm9z/nix-2.34.1-x86_64-linux.tar.xz
        system=x86_64-linux
        ;;
    Linux.i?86)
        hash=c620c7b891be57f9b8ab3ce27ea5668aa3c42bed869a996f63de95a25c032e3f
        path=77la5yay4222z5xdnrwda41lhcyypq8c/nix-2.34.1-i686-linux.tar.xz
        system=i686-linux
        ;;
    Linux.aarch64)
        hash=81aed0600605ee0494d2cd82c441b1ff6ecad7d3efcc6d4505a70aefc67b865c
        path=kvnvmnkxi13mxs5707xdcppsjsi74ck6/nix-2.34.1-aarch64-linux.tar.xz
        system=aarch64-linux
        ;;
    Linux.armv6l)
        hash=af77d98cfc43b87fee61eb096f4f7be8fbbfa8733983d317c93c7f1f40d8efcd
        path=3pzzbiqn699k8fixlh192hl6nhgls2r6/nix-2.34.1-armv6l-linux.tar.xz
        system=armv6l-linux
        ;;
    Linux.armv7l)
        hash=94dcfa01a949c0883de59b7093797460992098a42cc0c51eb7e742851645e4f6
        path=f6ah90dgghlblxx9sa2icpvm0x9yk00r/nix-2.34.1-armv7l-linux.tar.xz
        system=armv7l-linux
        ;;
    Linux.riscv64)
        hash=daca7ad2b4675053ae703998be088362dcb574a4603bb988633883ab6ecc66ad
        path=s2xpn9nnc67rh5n8d38bz3635wmb452a/nix-2.34.1-riscv64-linux.tar.xz
        system=riscv64-linux
        ;;
    Darwin.x86_64)
        hash=8c6987d96e7e23ef9398ec3acc03d6495a146bd07991975fa87bc08040262d65
        path=1j490n6axa28f4p3npr9gh9zyr2vvl9q/nix-2.34.1-x86_64-darwin.tar.xz
        system=x86_64-darwin
        ;;
    Darwin.arm64|Darwin.aarch64)
        hash=9a936c61f7848811a0f6c5f372ff97b62bf3669642977b6809751c05fa699af7
        path=76sicysz8bp04rrbhj06w64042smwq9l/nix-2.34.1-aarch64-darwin.tar.xz
        system=aarch64-darwin
        ;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

# Use this command-line option to fetch the tarballs using nar-serve or Cachix
if [ "${1:-}" = "--tarball-url-prefix" ]; then
    if [ -z "${2:-}" ]; then
        oops "missing argument for --tarball-url-prefix"
    fi
    url=${2}/${path}
    shift 2
else
    url=https://releases.nixos.org/nix/nix-2.34.1/nix-2.34.1-$system.tar.xz
fi

tarball=$tmpDir/nix-2.34.1-$system.tar.xz

require_util tar "unpack the binary tarball"
if [ "$(uname -s)" != "Darwin" ]; then
    require_util xz "unpack the binary tarball"
fi

if command -v curl > /dev/null 2>&1; then
    fetch() { curl --fail -L "$1" -o "$2"; }
elif command -v wget > /dev/null 2>&1; then
    fetch() { wget "$1" -O "$2"; }
else
    oops "you don't have wget or curl installed, which I need to download the binary tarball"
fi

echo "downloading Nix 2.34.1 binary tarball for $system from '$url' to '$tmpDir'..."
fetch "$url" "$tarball" || oops "failed to download '$url'"

if command -v sha256sum > /dev/null 2>&1; then
    hash2="$(sha256sum -b "$tarball" | cut -c1-64)"
elif command -v shasum > /dev/null 2>&1; then
    hash2="$(shasum -a 256 -b "$tarball" | cut -c1-64)"
elif command -v openssl > /dev/null 2>&1; then
    hash2="$(openssl dgst -r -sha256 "$tarball" | cut -c1-64)"
else
    oops "cannot verify the SHA-256 hash of '$url'; you need one of 'shasum', 'sha256sum', or 'openssl'"
fi

if [ "$hash" != "$hash2" ]; then
    oops "SHA-256 hash mismatch in '$url'; expected $hash, got $hash2"
fi

unpack=$tmpDir/unpack
mkdir -p "$unpack"
tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"

script=$(echo "$unpack"/*/install)

[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
export INVOKED_FROM_INSTALL_IN=1
"$script" "$@"

} # End of wrapping
