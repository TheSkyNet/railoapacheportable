## 503 Service Temporarily Unavailable ##

If you try to run Apache when Railo is not running or is still starting Apache will throw a 503 error stating "Service Temporarily Unavailable" with the following text"

---

The server is temporarily unable to service your request due to maintenance downtime or capacity problems. Please try again later.

Additionally, a 503 Service Temporarily Unavailable error was encountered while trying to use an ErrorDocument to handle the request.

---


Apache will throw this error until it is restarted with Railo running.

## Work around ##
  * Shut down Apache using apache\_stop.bat
  * Shut down Railo using stoptRailo.bat
  * Start Railo using startRailo.bat
  * Start Apache using apache\_start.bat
  * Wait until both have fully started.


### To prevent this from happening in the first Place ###
Start Railo _before_ starting Apache and wait until both have finished starting up before accessing the server.

As long as **both** Apache _and_ Railo are running you should be fine,
