# iTV

iTV is a tvOS application that aggregates several Iranian video on demand platforms. The project currently displays the supported platforms and uses localized Persian strings. Each provider is implemented as a separate module and now includes a vector logo asset.

## Platforms

- Filimo
- Film Net
- Star Net

## Notes

The FilmNet API is inconsistent about how widgets are returned. Sometimes
they appear under a `data` field, other times under `data.widgets` or even a
top-level `widgets` key. When no container is present the API returns the
array directly. The `FilmNetService` now tries each format in turn so the
home screen loads regardless of which wrapper is used.

## License

This project is released under the terms of the Business Source License 1.1. See `LICENSE.md` for details.

## Credits

Parts of this repository were generated with the help of [Codex](https://github.com/github-codex).
