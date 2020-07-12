# README

This is blog service made by ruby on rails.
The purpose to meke this system is under 2 points.

1. Build rails service using Docker
2. Use rails 6 Action Text

## Setup
First of all, please clone this repository
```
git clone git@github.com:yukimurasawa/yuklog.git
```

Second, build docker image
```
docker-compose up -d 
```

Third, run container and open bash
```
docker-compose exec web bash
```

Last, up rails server
 ```
 rails s -b 0.0.0.0
 ```
