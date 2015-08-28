Railo Apache Portable contains the Open Source Railo Railo 3.1.2.001  CFML engine bundled and pre-configured to work with XAMPP 1.7.2 so you can run .cfm files side by side with .php file and have them served up by Apache.

Xampp Railo Portable Includes the full version of XAMPP for Windows 1.7.2, (2009/08/10)

http://www.apachefriends.org/en/xampp-windows.html

XamppLite Railo Portable uses the Lite version of XAMPP for Windows 1.7.2

http://www.apachefriends.org/en/xampp-windows.html#646

And Railo Server (railo-3.1.1.000-resin-with-jre-windows.zip)
http://www.getrailo.org/index.cfm/download/


# Notes #
The Apache httpd.conf file is pre-configured to use Railo to process .cfm pages and to have index.cfm files be the default index document.

Railo and Resin are configured to so that all  .cfm file are served up from the [root](XAMPP.md)/htdocs directory along with the usual .html and .php file served by Apache.



# IMPORTANT #

This is not by any means meant to run in a production environment. Please make sure to properly lock down both Railo and XAMPP. See the [Installation](http://code.google.com/p/railoapacheportable/wiki/Installation) guide in the wiki for details.