{
  allowUnfree = true;
  pulseaudio = true;
  permittedInsecurePackages = [
    "openssl-1.0.2u" # necessary for a pentest lib
  ];
}
