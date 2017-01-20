# PlugCowboy2Example

An example application for using [plug_cowboy2](https://github.com/voicelayer/plug_cowboy2).

The diff for upgrading from cowboy to cowboy2 is available in this commit:

https://github.com/voicelayer/plug_cowboy2_example/commit/4593f7852caf24193d0866f17630e4c153615c24


## Running

 * `git clone git@gitgub.com:voicelayer/plug_cowboy2_example.git`
 * `cd plug_cowboy2_example`
 * An SSL certificate is required as most browsers only support
   HTTP/2 when using HTTPS
 * `openssl req -new -newkey rsa:4096 -days 365 -nodes -x509
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"
    -keyout priv/server.key -out priv/server.pem`
 * `mix deps.get`
 * `iex -S mix`
 * Navigate to [https://localhost:4001](https://localhost:4001)

If the application is successfully running under HTTP/2 then you
should see:

![http2](https://raw.githubusercontent.com/VoiceLayer/plug_cowboy2_example/master/docs/http2.png)


Otherwise you should see:

![not-http2](https://raw.githubusercontent.com/VoiceLayer/plug_cowboy2_example/master/docs/not-http2.png)

If you navigate to the [http version](http://localhost:4002)
of the site you will see
the message above.
