# Frontends

Privacy focused frontends in a `docker-compose` stacked all routed over a VPN.

- [nitter](https://github.com/zedeus/nitter) - Twitter
- [teddit](https://codeberg.org/teddit/teddit) - Reddit
- [invidious](https://github.com/iv-org/invidious) - Youtube
- [searxng](https://github.com/searxng) - Search
- [bibliogram](https://sr.ht/~cadence/bibliogram/) - Instagram
- [scribe](https://scribe.rip/) - Medium
- [imgin](https://imgin.voidnet.tech/) - Imgur

See [Awesome Privacy](https://github.com/pluja/awesome-privacy) for additional tools.

## Configuration

There are no specific build instructions other than trying to run `build.sh` and fixing anything that fails.

Common configuraions required are

- Update `example.com` in all configs to desired TLD
- OpenVPN configuration in `./openvpn/openvpn.ovpn`
- Wildcard Let's Encrypt certificate in `/etc/letsencrypt/live/example.com/`

## Notes

### Invidious
On IOS, Use [Yattee](https://github.com/yattee/yattee) with Invidious to watch Youtube with Sponsor block and proxy videos.

Invidious has a [known issue](https://github.com/iv-org/invidious/issues/1823) where subscriptions will not update unless using PubSub (requiring a public instance) or restarting occasionally.

Following crontab will restart invidious and nginx every hour,

```
0 * * * * docker restart invidious nginx
```

### Redirects
[Redirector](https://addons.mozilla.org/en-US/firefox/addon/redirector/) browser extension can automatically redirect domains to privacy focused domains and basic configuration is in `./redirector`.


