# AlphaVantage CFML API wrapper

Wraps the [AlphaVantage](https://alphavantage.io) API for easy CFML usage using the [Hyper](https://github.com/elpete/hyper) ColdBox module.

![AlphaVantage Release](https://github.com/michaelborn/alphavantage/actions/workflows/release.yml/badge.svg?branch=main)

## Getting Started

1. Install this module - `box install AlphaVantage`
2. Configure AlphaVantage API secrets using `.env`
3. OR configure AlphaVantage API via ColdBox `moduleSettings`

## Environment Variable Configuration

AlphaVantage can mainly be configured using environment variables:

* `ALPHAVANTAGE_API_KEY` - Required API key for authenticating with the AlphaVantage API
* `FINNUHB_API_URL` - base URL of the AlphaVantage API.

You'll need to either use `commandbox-dotenv` to automatically populate environment variables from the `.env` file on server start, or manually read this file to populate environment variables inside your application.

```bash
# .env file
# AlphaVantage API Credentials
ALPHAVANTAGE_API_KEY=
ALPHAVANTAGE_API_URL=https://alphavantage.io/api/v1
```

As an aside, PLEASE ensure you ignore this file in your `.gitignore`!

## ColdBox Module Configuration via ModuleSettings

Set this in `config/ColdBox.cfc` in the `configure()` method:

```js
moduleSettings.alphavantage = {
    apiKey : "blablasecret",
    apiURL : "my.url"
};
```

## API Reference

Each api method returns a [`HyperResponse` object](https://github.com/coldbox-modules/hyper#hyperresponse) with the following methods (not exhaustive):

* `response.isSuccess()` - boolean
* `response.isError()` - boolean
* `response.json()` - JSON deserialized to a struct or array
* `response.getData()` - unchanged data payload

See the [Hyper docs](https://github.com/coldbox-modules/hyper#hyperresponse) for more info on using a `HyperResponse`.

### Fundamentals

#### getCompanyOverview

```js
var response = getInstance( "Fundamentals@AlphaVantage" ).getCompanyOverview( "MSFT" );
```

| Parameter | Type | Description
| --------- | -------- | --------------------------------------- |
| `symbol`  | `string` | **Required**. Stock symbol to fetch     |

#### GetCompanyEarnings

```js
var response = getInstance( "Fundamentals@AlphaVantage" ).getCompanyEarnings( "MSFT" );
```

| Parameter | Type | Description
| --------- | -------- | --------------------------------------- |
| `symbol`  | `string` | **Required**. Stock symbol to fetch     |