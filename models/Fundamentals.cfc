/**
 * I wrap all company-related AlphaVantage API calls
 */
component{
    property name="AlphaVantageClient" inject="AlphaVantageClient";

    public component function init(){
        return this;
    }

    /**
     * Get company overview fundamentals
     * @symbol company stock symbol of data to retrieve
     * 
     * @see https://www.alphavantage.co/documentation/#company-overview
     */
    public function getCompanyOverview( required string symbol ){
        var queryParams = {
            "function": "OVERVIEW",
            "symbol"  : arguments.symbol
        };
        return AlphaVantageClient.setMethod( "GET" ).withQueryParams( queryParams ).send();
    }
}