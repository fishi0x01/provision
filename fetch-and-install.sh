#!/bin/bash
## This script should be used as 'curl https://raw.githubusercontent.com/fishi0x01/local-env/master/fetch-and-install.sh | sh'

{ # Prevent execution if this script was only partially downloaded
  curl -sL https://github.com/fishi0x01/local-env/archive/master.tar.gz | tar -xz && mv ./local-env-master ./local-env && cd ./local-env && ./install.sh && cd .. && rm -r ./local-env && git clone https://github.com/fishi0x01/local-env.git
}
