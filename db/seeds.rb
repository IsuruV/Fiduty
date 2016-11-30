# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

1	Human	Stacy Panterson	Certified Financial Planner	St. Louis, MO
    advisor = Advisor.create(type:'Human',name:'Stacy Paterson', address:'St. Louis, MO')
    advisor.portfolios.create(fund_type:'Certified Financial Planner')
2	Robot	General Robotics Fund	Passive index Fund	Phoenix, AR
    advisor =Advisor.create(type:'Robot',name:'General Robotics Fund', address:'Phoenix, AR')
    advisor.portfolios.create(fund_type:'Passive Index Fund')
3	Human	Israel George	Financial Advisor	San Diego, CA
    advisor =Advisor.create(type:'Human',name:'Israel George',address:'San Diego, CA')
    advisor.portfolios.create(fund_type:'Certified Financial Advisor')
4	Human	Jody Santiago	Certified Financial Planner	Burlington, VT
    advisor =Advisor.create(type:'Human',name:'Jody Santiago', address:'Burlington, VT')
    advisor.portfolios.create(fund_type:'Certified Financial Planner')
5	Robot	Coaster Index Fund	Passive index Fund	Des Moines, IA
    advisor =Advisor.create(type:'Robot',name:'Coaster Index Fund', address:'Des Moines, IA')
    advisor.portfolios.create()
6	Human	Amy Schultz	Certified Financial Planner	Long Island, NY
    advisor =Advisor.create(type:'Human', name:'Amy Schultz', address:'Long Island, NY')
    advisor.portfolios.create()
7	Human	Erik Valdez	Certified Financial Planner	Springdale, AR
    advisor =Advisor.create(type:'Human', name:'Erik Valdez', address:'Springdale, AR')
    advisor.portfolios.create()
8	Robot	Bulldog 300 ETF	Passive Index Fund	Austin, TX
    advisor =Advisor.create(type:'Robot', name:'Bulldog 300 ETF', address:'Austin, TX')
    advisor.portfolios.create()
9	Robot	BA PLUS Index Fund	Passive Index Fund	Charlotte, NC
    advisor =Advisor.create(type:'Robot', name:'BA PLUS Index Fund', address:'Charlotte, NC')
    advisor.portfolios.create()
10	Human	Lloyd Potter	Financial Advisor	Milwaukee, WI
    advisor =Advisor.create(type:'Human', name:'Lloyd Potter', address:'Milwaukee, WI')
    advisor.portfolios.create()
11	Human	Lance Curtis	Certified Financial Planner	Jersey City, NJ
    advisor =Advisor.create(type:'Human', name:'Lance Curtis', address:'Jersey City, NJ')
    advisor.portfolios.create()
12	Robot	Orion Index Fund	Passive Index Fund	Boston, MA
    advisor =Advisor.create(type:'Robot',name:'Orion Index Fund', address:'Boston, MA')
    advisor.portfolios.create()
13	Robot	Lions Mid-Cap Index Fund	Passive Index fund	Bridgeport, CT
    advisor =Advisor.create(type:'Robot', name:'Lions Mid-Cap Index Fund', address:'Bridgeport, CT')
    advisor.portfolios.create()
14	Robot	Bullix Value index Fund	Passive Index fund	Wilmington, DE
    advisor =Advisor.create(type:'Robot',name:'Bullix Value index Fund', address:'Wilmington, DE')
    advisor.portfolios.create()
15	Human	Felicia Shaw	Financial Advisor	Houston, TX
    advisor =Advisor.create(type:'Human', name:'Felicia Shaw', address:'Houston, TX')
    advisor.portfolios.create()
16	Robot	Wisenvest 100 Index Direct Fund	Passive Index fund	Seattle, WA
    advisor =Advisor.create(type:'Robot', name:'Wisenvest 100 Index Direct Fund', address:'Seattle, WA')
    advisor.portfolios.create()
17	Human	Marvin Adkins	Certified Financial Planner	Salt Lake City, UT
    advisor =Advisor.create(type:'Human', name:'Marvin Adkins', address:'Salt Lake City, UT')
    advisor.portfolios.create()
18	Robot 	SPDR S&P500	ETF	Boston, MA
    advisor =Advisor.create(type:'Robot', name:'SPDR S&P500', address:'Boston, MA')
    advisor.portfolios.create()    
19	Robot 	Wealthfront 	Robo-advisor	Redwood, CA
   advisor = Advisor.create(type:'Robot', name:'Wealthfront', address:'Redwood, CA')
    advisor.portfolios.create()
20	Robot 	Betterment	Robo-advisor	New York, NY
    advisor =Advisor.create(type:'Robot', name:'Betterment', address:'New York, NY')
    advisor.portfolios.create()    
21	Human	John Smith	Certified Financial Planner	Miami, FL
    advisor =Advisor.create(type:'Human', name:'John Smith', address:'Miami, FL')
     advisor.portfolios.create()   
22	Human	Amber Mills	Certified Financial Planner	Omaha, NE
    advisor =Advisor.create(type:'Human', name:'Amber Mills', address:'Omaha, NE')
    advisor.portfolios.create()
23	Human	Erica Allen	Financial Advisor	Chicago, IL
   advisor = Advisor.create(type:'Human', name:'Erica Allen', address:'Chicago, IL')
    advisor.portfolios.create()
24	Human	Alberta Pierce	Certified Financial Planner	Minneapolis, MN
   advisor = Advisor.create(type:'Human', name:'Alberta Pierce', address: 'Minneapolis, MN')
   advisor.portfolios.create()