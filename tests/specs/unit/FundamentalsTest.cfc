component extends="testbox.system.BaseSpec" {
    function beforeAll(){
        variables.model = createMock( "models.Fundamentals" );

        variables.AlphaVantageClient = new hyper.models.HyperBuilder(
            baseURL = server.system.environment[ "ALPHAVANTAGE_API_URL" ],
            queryParams = {
                "apikey" : server.system.environment[ "ALPHAVANTAGE_API_KEY" ]
            }
        );

        variables.model.$property( propertyName = "AlphaVantageClient", mock = variables.AlphaVantageClient );
    }
    function run() {
        describe( "Company suite", function() {
            it( "+getCompanyOverview()", function() {
                var result = variables.model.getCompanyOverview( "MSFT" );

                expect( isInstanceOf( result, "hyper.models.HyperResponse" ) ).toBeTrue( "should return hyperResponse object" );

                debug( result.getData() );

                expect( result.isSuccess() ).toBeTrue( "should return successfull status code" );

                expect( isJSON( result.getData() ) ).toBeTrue( "should return JSON" );

                expect( result.json() ).toHaveKey( "MarketCapitalization" );
            } );

            it( "+getCompanyEarnings()", function() {
                var result = variables.model.getCompanyEarnings( "MSFT" );

                expect( isInstanceOf( result, "hyper.models.HyperResponse" ) ).toBeTrue( "should return hyperResponse object" );

                debug( result.getData() );

                expect( result.isSuccess() ).toBeTrue( "should return successfull status code" );

                expect( isJSON( result.getData() ) ).toBeTrue( "should return JSON" );
                expect( result.json() ).toHaveKey( "annualEarnings" );
            });
        } );
    }
}