# Nim-Libravatar

[Libravatar](https://www.libravatar.org) library for [Nim](https://nim-lang.org/learn.html), Gravatar alternative. Libravatar is an open source federated avatar api and service.

![](https://img.shields.io/github/languages/top/juancarlospaco/nim-libravatar?style=for-the-badge)
![](https://img.shields.io/github/languages/count/juancarlospaco/nim-libravatar?logoColor=green&style=for-the-badge)
![](https://img.shields.io/github/stars/juancarlospaco/nim-libravatar?style=for-the-badge "Star nim-libravatar on GitHub!")
![](https://img.shields.io/github/languages/code-size/juancarlospaco/nim-libravatar?style=for-the-badge)
![](https://img.shields.io/github/issues-raw/juancarlospaco/nim-libravatar?style=for-the-badge "Bugs")
![](https://img.shields.io/github/issues-pr-raw/juancarlospaco/nim-libravatar?style=for-the-badge "PRs")
![](https://img.shields.io/github/last-commit/juancarlospaco/nim-libravatar?style=for-the-badge "Commits")

# Features

- Your users nor you dont need a Libravatar account if you dont want to, because if Libravatar cant find you it redirects you to your Gravatar, if you have no Gravatar then it returns a default autogenerated image.
- Federation supported passing `baseUrl`, DNS server discovery is up to you if you want to, Pull Request welcome.
- 404 wont return 404, but a default image, use `default="404"` for a HTTP 404 Error.
- Uses `func` so is Side Effects Free, works with Async & MultiSync.
- `runnableExamples` included, Self-Documented, NEP-1 Ok.
- Best quality avatar sizes are between `80` & `128`, `512` may or may not look a little stretched, depends on original quality.
- Tiny and simple but reusable code.
- By design is also a Gravatar library :)


# Install

- `nimble install libravatar`
- [You can create an account for free, it only needs an email.](https://www.libravatar.org/accounts/new/)


# Use

```nim
import libravatar
var email = "me@aaronsw.com"
getLibravatarUrl(email)
echo email
email = "me@aaronsw.com"
getLibravatarUrl(email, size=512, default="monsterid")
echo email
email = "me@aaronsw.com"
getLibravatarUrl(email, size=9, default="404", baseUrl="https://MyCustomFederatedServer.org/avatar/")
echo email
```


# Libravatar App

- This module is also a crossplatform command line terminal App.
- Just compile and run it, compiles to a single file 0-dependency native binary executable of ~120Kb.
- Only takes 1 argument thats the email that you want the avatar from, filename will be the email.

```
$ nim c -d:release -d:ssl libravatar.nim
$ ./libravatar "me@aaronsw.com"
$ file "me@aaronsw.com.jpg"
me@aaronsw.com.jpg: JPEG image data, JFIF standard 1.0, resolution (DPI), precision 8, 128x128
```


# Libravatar Vs Gravatar

<table class="border">
    <thead>
        <tr>
            <th>Feature</th>
            <th>Libravatar</th>
            <th>Gravatar</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>JPEG and <strong>PNG</strong> support</td>
            <td> Yes</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td>GIF support</td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td>Upload size limit</td>
            <td> 10 MB</td>
            <td> ???</td>
        </tr>
        <tr>
            <td>Image size (in pixels)</td>
            <td> 1 to 512</td>
            <td> 2048</td>
        </tr>
        <tr>
            <td><strong>HTTPS</strong> support</td>
            <td> Yes</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td><strong>IPv6</strong> support</td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td>Supported email hashes</td>
            <td> MD5, SHA256</td>
            <td> <a href="http://en.gravatar.com/site/faq/#answer-2-1">MD5 only</a></td>
        </tr>
        <tr>
            <td><strong>OpenID</strong> URL support</td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td>Redirection to Gravatar</td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td>Customizable default image</td>
            <td> Yes</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td>MPAA-style image ratings (Adult Content, Nude, Porn)</td>
            <td> G-Rated only (No Porn)</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td>Text-based profile information</td>
            <td> No</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td><strong>Federation</strong> via DNS SRV records</td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td><strong>LDAP</strong> authentication</td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td><strong>OpenID</strong> authentication</td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td>Automatic photo <strong>importers</strong></td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td>Translated user interface</td>
            <td> Yes</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td>Account <strong>export</strong></td>
            <td> Yes</td>
            <td> No</td>
        </tr>
        <tr>
            <td>Account <strong>deletion</strong></td>
            <td> Yes</td>
            <td> <a href="http://en.gravatar.com/site/faq/#answer-1-7">No</a></td>
        </tr>
        <tr>
            <td>XML-RPC API</td>
            <td> No</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td>Libraries/plugins available</td>
            <td> Yes</td>
            <td> Yes</td>
        </tr>
        <tr>
            <td><strong>Free and Open Source software</strong></td>
            <td> <a href="http://www.gnu.org/licenses/agpl.html">Yes</a></td>
            <td> <a href="http://blog.gravatar.com/2010/05/31/gravatar-localization/#comment-8749">No</a></td>
        </tr>
        <tr>
            <td>Distributed service</td>
            <td> Community mirrors</td>
            <td> Commercial Proprietary</td>
        </tr>
        <tr>
            <td>Corporate owner</td>
            <td> No</td>
            <td> <a href="http://automattic.com/">Automattic</a></td>
        </tr>
    </tbody>
</table>


# Stars

![Star nim-libravatar on GitHub](https://starchart.cc/juancarlospaco/nim-libravatar.svg "Star nim-libravatar onGitHub!")
