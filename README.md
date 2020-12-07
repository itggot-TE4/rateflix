# README

## Installation
Install dependencies:
```
sudo gem install docker-sync
```
Install app with:
```
docker-compose run web bundle install
docker-compose build
```

## Running
```
docker-sync clean
docker-sync start
docker-compose up
```

## Testing
```
npm install cypress --save-dev
npx cypress open
```

## Tap into docker shell
```
docker-compose exec web bash
```
