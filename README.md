# Phinx Tutorial
This is a quick start for Phinx.

We will create a project called Raven.

You will need:
* MySQL
* A folder for the Raven files
* Composer

## Make the raven folder

`mkdir raven && cd raven`

Using a text editor make a file named composer.json and add the following to it:

```
{
    "require": {
        "robmorgan/phinx": "*"
    }
}
```

_* assumes you have composer installed_

Run composer:
`composer install`

You will see the following output:
>Loading composer repositories with package information
>Updating dependencies (including require-dev)
>Package operations: 8 installs, 0 updates, 0 removals
>  - Installing symfony/yaml (v3.3.6): Loading from cache
>  - Installing psr/log (1.0.2): Loading from cache
>  - Installing symfony/debug (v3.3.6): Loading from cache
>  - Installing symfony/polyfill-mbstring (v1.4.0): Loading from cache
>  - Installing symfony/console (v3.3.6): Loading from cache
>  - Installing symfony/filesystem (v3.3.6): Loading from cache
>  - Installing symfony/config (v3.3.6): Loading from cache
>  - Installing robmorgan/phinx (v0.8.1): Loading from cache
>symfony/console suggests installing symfony/event-dispatcher ()
>symfony/console suggests installing symfony/process ()
>Writing lock file
>Generating autoload files
