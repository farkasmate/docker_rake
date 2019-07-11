# rake

Run Rake tasks in a Docker container easily.

Add [docker-compose.yaml](docker-compose.yaml) to any Rake project (Ruby 2.4) and run `docker-compose up`.

## Build

```
bundle install
bundle exec rake build
```

## Release

```
echo 1.0.0 > VERSION
bundle exec rake release
```

## Usage

Print help:

```
docker run --rm matefarkas/rake-2.4:latest --help
```

Bootstrap projects:

```
docker run --rm matefarkas/rake-2.4:latest --help 2> /dev/null > docker-compose.yaml
RAKE_ARGS=--tasks docker-compose up
```

Quiet output:

```
QUIET=1 docker-compose up
```
