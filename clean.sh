#!/usr/bin/env sh

main() {
  cd buildroot || exit 1
  make distclean
}

main "$@"
