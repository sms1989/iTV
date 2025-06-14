# iTV

iTV is a tvOS application that aggregates several Iranian video on demand platforms. The project currently displays the supported platforms and uses localized Persian strings. Each provider is implemented as a separate module and now includes a vector logo asset.

## Platforms

- Filimo
- Film Net
- Star Net

## Notes

The FilmNet API responses sometimes omit the `data` container. The home page
loader now falls back to decoding an array when the `data` field is missing.

## License

This project is released under the terms of the Business Source License 1.1. See `LICENSE.md` for details.

## Credits

Parts of this repository were generated with the help of [Codex](https://github.com/github-codex).
