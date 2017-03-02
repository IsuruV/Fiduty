var socialContent = `  <div class="main-dashboard">
		  <div class="social-content">
		<div class="content-mid">
				<div class="middle-content" style="margin-top:5px; margin-bottom:15px; margin-left:20px; margin-right:20px;border-style:none; box-shadow:none " >
                <div class="col-md-12">
        <div class="row-fluid">
             <div class="btn-group btn-group-justified">
  <a id="everyonebtn" href="#" class="btn btn-primary btn-lg">Everyone</a>
  <a id="friendsbtn" href="#" class="btn btn-primary btn-lg">Friends</a>
  <a id="scoreboardbtn" href="#" class="btn btn-primary btn-lg">Scoreboard</a>
                </div>
        </div>
        <br>
        
        
 <!----------------Social Feed
					---------------------->
       
       
        
<div id="people" class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;">
  <a href="#" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px">
    <div class="row">
      <div class="col-sm-3"><div style="height:140;border:0px solid #000">
      <img src="/assets/Isuruprofile.jpg" class="img-circle img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
      </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Bob chipped in SPYDR POOP index</h3><small class="text-muted">3 days ago</small> </div>
      </div><!----><div class="col-md-2" style="margin-top:90px"><button type="button" class="btn btn-success btn-lg" style="position: absolute; right: 10px;">Chip in</button></div>
      </div>
     </a>
  <a href="#" class="list-group-item clearfix list-group-item-action flex-column align-items-start" style="border-radius:0px">
<div class="row">
  <div class="col-sm-3"><div style="height:140;border:0px solid #000"><img src="/assets/Rashidprofile.jpg" class="img-circle img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
  </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Trump chipped in The Wall Fund</h3><small class="text-muted">3 days ago</small> </div></div>
  <div class="col-md-2" style="margin-top:90px"><button type="button" class="btn btn-success btn-lg" style="position: absolute; right: 10px;">Chip in</button></div>
  </div>
</a>
  <a href="#" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px">
    <div class="row">
      <div class="col-sm-3"><div style="height:140;border:0px solid #000">
      <img src="/assets/Isuruprofile.jpg" class="img-circle img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
      </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Bob chipped in SPYDR POOP index</h3><small class="text-muted">3 days ago</small> </div>
      </div><!----><div class="col-md-2" style="margin-top:90px"><button type="button" class="btn btn-success btn-lg" style="position: absolute; right: 10px;">Chip in</button></div>
      </div>
     </a>
  <a href="#" class="list-group-item clearfix list-group-item-action flex-column align-items-start" style="border-radius:0px">
<div class="row">
  <div class="col-sm-3"><div style="height:140;border:0px solid #000"><img src="/assets/Rashidprofile.jpg" class="img-circle img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
  </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Trump chipped in The Wall Fund</h3><small class="text-muted">3 days ago</small> </div></div>
  <div class="col-md-2" style="margin-top:90px"><button type="button" class="btn btn-success btn-lg" style="position: absolute; right: 10px;">Chip in</button></div>
  </div>
</a>
  </div>
			</div>
			<div class="clearfix"> </div>
		</div>
		</div>
		</div>
		</div>`

var mainDashBoardContent =`  <div class="main-dashboard">
    	
    	
    	<div class="col-md-6">
		<div class="middle-content" style="height:400px; border-style:none; box-shadow:none;padding-top:10px; padding-left:20px; padding-right:20px">
		    
		    <h2 style="text-align:center;">Tasks</h2><br>
	        <div class="row-fluid">
            <div class="btn-group btn-group-justified" style="height:80px;">
              <a href="#" class="btn btn-warning btn-lg" style="white-space: normal">Completed</a>
              <a href="#" class="btn btn-success btn-lg" style="white-space: normal;">Current tasks</a>
              <a href="#" class="btn btn-primary btn-lg" style="white-space: normal;">Upcoming tasks</a>
            </div>
            </div>
        
 <!----------------Cards---------------------->
        
            <div class="list-group" style="font-family:'Roboto'; font-size:16px; color:#666666; padding-top:1em"><% escape_javascript @user.tasks.each do |task| %>

                <a href="#" class="list-group-item clearfix list-group-item-action flex-column align-items-start" style="border-radius:0px">
                <div class="row">
                    
                    <div class="col-md-1"><h4 style="color:green"><i class="fa fa-check" aria-hidden="true"></i></h4>
                    </div><!----><div class="col-md-8 vcenter" style="height:80;border:0px solid #F00; padding-left:10px;"><h4><%= escape_javascript task.task%></h4>
                </div><!----><div class="col-md-3 vcenter" style="height:80;border:0px solid #F00; padding-left:10px;color:green"><h4>+0.5% Try</h4>
                </div>
                </div>
                </a>

                <% escape_javascript end %>
            </div>
</div></div><!----><div class="col-md-6">
				<div class="middle-content" style="padding-top:10px; padding-bottom:auto; padding-top:10px; padding-left:20px; padding-right:20px; margin-right:0px;border-style:none; box-shadow:none; border-radius:0px">
		      <p><h2 class="featurette-heading" style="text-align:center">Upcoming Features</h2><br>
				<span style="font-family:'Roboto'; color:Black; font-size:16px">
					<div class="list-group" style="border-radius:0px">
  						<a href="#" class="list-group-item active"  style="border-radius:0px">
    					Group investing - March 1st, 2017
  						</a>
  						<a href="#" class="list-group-item"  style="border-radius:0px">Levels in the social feed - March 15th, 2017
  						</a>
  						<a href="#" class="list-group-item"  style="border-radius:0px">IOS application - March 31st, 2017
  						</a>
    					<a href="#" class="list-group-item"  style="border-radius:0px">Real money investment - August 1st, 2017
  						</a>
					</div>
		      
		    </div>
			</div>
			</div>
`

var knowledgeContent = `<div class="main-dashboard">
	<div class="middle-content" style="margin-top:0px; margin-bottom:10px; margin-left:10px; margin-right:10px;border-style:none; box-shadow:none " >
		
	<!------------Content title------------->	
	
		<div class="row-fluid" style="height:100px">
		<div class="col-sm-12" style="text-align:center"><p><h1>Here you get knowledge to understand finance</h1></p>
    </div>
    </div>
    
  <!------------------------->

    <div class="row-fluid">
    <div class="btn-group btn-group-justified" style="height:400px;">
      <a href="#" class="btn btn-warning btn-lg" style="white-space: normal">Learn basic finance concepts and understand them</a>
      <a href="#" class="btn btn-success btn-lg" style="white-space: normal;">Take a quiz, check that you got the topic and earn 10 virtual $ to invest</a>
      <a href="#" class="btn btn-primary btn-lg" style="white-space: normal;">Get some tips as you go to improve your investments</a>
    </div>
    </div>
    <br>
        
 <!----------------Cards---------------------->
        
    <div class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;">
    
    
      <a href="#" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px">
        <div class="row">
          <div class="col-sm-3">
          <div style="height:140;border:0px solid #000">
          <img src="/assets/Isuruprofile.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
          </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px">
          <div style="height:80;border:0px solid #F00"><h2>What is investment?</h2><small class="text-muted">3 days ago</small>
          </div>
          </div>
        </div>
      </a>
      
      <a href="#" class="list-group-item clearfix list-group-item-action flex-column align-items-start" style="border-radius:0px">
        <div class="row">
          <div class="col-sm-3">
          <div style="height:140;border:0px solid #000"><img src="/assets/Rashidprofile.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
          </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px">
          <div style="height:80;border:0px solid #F00"><h2>Stocks explained</h2><small class="text-muted">3 days ago</small>
          </div>
          </div>
        </div>
      </a>
      
      <a href="#" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px">
        <div class="row">
          <div class="col-sm-3">
          <div style="height:140;border:0px solid #000">
          <img src="/assets/Isuruprofile.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
          </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px">
          <div style="height:80;border:0px solid #F00"><h2>What is investment?</h2><small class="text-muted">3 days ago</small>
          </div>
          </div>
        </div>
      </a>

      <a href="#" class="list-group-item clearfix list-group-item-action flex-column align-items-start" style="border-radius:0px">
        <div class="row">
          <div class="col-sm-3">
          <div style="height:140;border:0px solid #000"><img src="/assets/Rashidprofile.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
          </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px">
          <div style="height:80;border:0px solid #F00"><h2>Stocks explained</h2><small class="text-muted">3 days ago</small>
          </div>
          </div>
        </div>
      </a>
  
  </div>`
  
  
  var experienceContent = `		<div class="main-dashboard" style="margin-top:0px; margin-bottom:10px; margin-left:10px; margin-right:10px;border-style:none; box-shadow:none " >
	
	<!------------Content title------------->   
		<div class="row-fluid" style="height:80px">
		  <div class="col-sm-12" style="text-align:center"><p><h1>Here you invest and get experience</h1></p>
      </div>
    </div>
  <!------------------------->

		<div class="row">
		  <div class="col-sm-12">
		      <div style="margin-left:40px; margin-right:40px; margin-top:0px; padding-bottom:40px; padding-left:20px">
		      <br>
		      <p><h2 class="featurette-heading">Total Investment: <span style="color:green">$285</span></h2></p><br>
		      <p><h2 class="featurette-heading">Total Value: <span style="color:green">$295</span></h2></p><br>
		      <p><h2 class="featurette-heading">Total Gain/Loss: <span style="color:green">$10</span></h2></p><br>
		      <p><h2 class="featurette-heading">ROI: <span style="color:green">1.6%</span></h2></p>
		  </div></div>
		</div>
		    
	<!------------Portfolio Listings------------->
		    
    <div class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;" >
    
      <a id="etf" href="#" class="list-group-item clearfix list-group-item-action align-items-start"  style="border-radius:0px">
        <div class="row">
          <div class="col-md-3">
          <div style="height:140;border:0px solid #000">
          <img src="/assets/SPDR.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:30px;margin-bottom:10px">
          </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>American Jumbo Companies</h3><small class="text-muted">Underlying Asset: SPDR S&P 500</small>
          </div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:green">17.5%</h2><br><button type="button" id="investbtn" class="btn btn-success btn-lg">Invest</button></div>
        </div>
        <div id="etf_detail" class="row" style="display:none;">
          <div class="col-md-3">
          </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
          <br><br><span style="color:grey">
          ----> Here --- how many friends have invested or smth</span></div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
        </div>
      </a>
      
      
      <a href="#" id="etf" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px; border-style:solid; border-color:black; border-width:thin;">
        <div class="row">
          <div class="col-md-3">
          <div style="height:140;border:0px solid #000">
          <img src="/assets/ishares_logo.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:30px;margin-bottom:10px">
          </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Techno Giants</h3><small class="text-muted">Underlying Asset: iShares U.S. Technology ETF</small>
          </div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:green">7.84%</h2><br><button type="button" id="investbtn" class="btn btn-success btn-lg">Invest</button></div>
        </div>
        
<!--------------------------More details when clicked on a portfolio------>
        <div id="etf_detail" class="row" style="display:none;">
          <div class="col-md-3">
          </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
          <br><br><span style="color:grey">
          ----> Here --- how many friends have invested or smth</span></div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
        </div>
      </a>
      
<!-------------------------------->
        
      <a href="#" id="etf" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px;border-top-style:solid; border-top-color:black; border-top-width:thin">
        <div class="row">
          <div class="col-md-3">
          <div style="height:140;border:0px solid #000">
          <img src="/assets/SPDR.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:10px;margin-bottom:10px">
          </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Wall Street Companies</h3><small class="text-muted">Underlying Asset: Financial Select Sector SPDR Fund</small>
          </div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:green">0.27%</h2><br><button id="investbtn" type="button" class="btn btn-success btn-lg">Invest</button></div>
        </div>
      <div id="etf_detail" class="row" style="display:none;">
          <div class="col-md-3">
          </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
          <br><br><span style="color:grey">
          ----> Here --- how many friends have invested or smth</span></div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
        </div>
      </a>
      
      <a href="#" id="etf" class="list-group-item clearfix list-group-item-action align-items-start"  style="border-radius:0px">
        <div class="row">
          <div class="col-md-3">
          <div style="height:140;border:0px solid #000">
          <img src="/assets/ishares_logo.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:30px;margin-bottom:10px">
          </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Oil and Gas companies</h3><small class="text-muted">Underlying Asset: U.S. Oil & Gas Exploration & Production ETF</small>
          </div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:red">-1.39%</h2><br><button type="button" id="investbtn" class="btn btn-success btn-lg">Invest</button></div>
        </div>
         <div id="etf_detail" class="row" style="display:none;">
          <div class="col-md-3">
          </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
          <br><br><span style="color:grey">
          ----> Here --- how many friends have invested or smth</span></div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
        </div>
      </a>
    </div>
    
  <!------------ End Portfolio Listings------------->  
    
	</div>`

// Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them
const etfList = (etfs)=>{
  var etf_list = `<div class="content-mid">`
  etf_list += `<div class="middle-content" style="padding-top:0px; margin-top:0px; margin-bottom:0px; margin-left:10px; margin-right:10px;border-style:none; box-shadow:none " >`
  etf_list += `<div class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;" >`;
  etf_list += `		<div class="row-fluid" style="height:80px; padding-top:0px">
		  <div class="col-sm-12" style="text-align:center; "><p><h1>Here you invest and get experience</h1></p>
      </div>
    </div>
  <!------------------------->

		<div class="row" style="padding-top:0px;">
		  <div class="col-md-10 col-md-offset-1" style="padding-top:0px;">
		      <br>
		      <p><h2 class="featurette-heading">Total Investment: <span style="color:green">$285</span></h2></p><br>
		      <p><h2 class="featurette-heading">Total Value: <span style="color:green">$295</span></h2></p><br>
		      <p><h2 class="featurette-heading">Total Gain/Loss: <span style="color:green">$10</span></h2></p><br>
		      <p><h2 class="featurette-heading">ROI: <span style="color:green">1.6%</span></h2></p><br>
		  </div>
		</div>
		
		
	<!------------------------->	
	        <div class="col-md-12">
        <div class="row-fluid">
          <div class="btn-group btn-group-justified">
            <a href="#" class="btn btn-primary btn-lg">Robots</a>
            <a href="#" class="btn btn-primary btn-lg">My investments</a>
          </div>
        </div>
        <br>
		    
	<!------------Portfolio Listings------------->`
	
  for(var i=0; i<etfs.length; i++){
    if(etfs[i].ytd){
    etf_list += ` <a id="etf" href="#" class="list-group-item clearfix list-group-item-action align-items-start"  style="border-radius:0px">
        <div class="row">
          <div class="col-md-3">
          <div style="height:140;border:0px solid #000">
          <img src="/assets/SPDR.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:30px;margin-bottom:10px">
          </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>American Jumbo Companies</h3><small class="text-muted">Underlying Asset: ${etfs[i].name}</small>
          </div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:green">${etfs[i].ytd}</h2><br><input type="hidden" id="portfolioId" value=${etfs[i].id}></input><input type="hidden" id="portfolioId" value=${etfs[i].name}></input><button type="button" id="investbtn" class="btn btn-success btn-lg">Invest</button></div>
        </div>
        <div id="etf_detail" class="row" style="display:none;">
          <div class="col-md-3">
          </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>${etfs[i].description}.
          <br><br><span style="color:grey">
          ----> Here --- how many friends have invested or smth</span></div>
          </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
        </div>
      </a>`
    }
  }
  etf_list += `</div>`
  etf_list += `</div>`
  etf_list += `</div>`
  return etf_list  
  
// `		
// 	<!------------Portfolio Listings------------->
		    
//     <div class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;" >
    
//       <a id="etf" href="#" class="list-group-item clearfix list-group-item-action align-items-start"  style="border-radius:0px">
//         <div class="row">
//           <div class="col-md-3">
//           <div style="height:140;border:0px solid #000">
//           <img src="/assets/SPDR.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:30px;margin-bottom:10px">
//           </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>American Jumbo Companies</h3><small class="text-muted">Underlying Asset: SPDR S&P 500</small>
//           </div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:green">17.5%</h2><br><button type="button" id="investbtn" class="btn btn-success btn-lg">Invest</button></div>
//         </div>
//         <div id="etf_detail" class="row" style="display:none;">
//           <div class="col-md-3">
//           </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
//           <br><br><span style="color:grey">
//           ----> Here --- how many friends have invested or smth</span></div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
//         </div>
//       </a>
      
      
//       <a href="#" id="etf" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px; border-style:solid; border-color:black; border-width:thin;">
//         <div class="row">
//           <div class="col-md-3">
//           <div style="height:140;border:0px solid #000">
//           <img src="/assets/ishares_logo.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:30px;margin-bottom:10px">
//           </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Techno Giants</h3><small class="text-muted">Underlying Asset: iShares U.S. Technology ETF</small>
//           </div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:green">7.84%</h2><br><button type="button" id="investbtn" class="btn btn-success btn-lg">Invest</button></div>
//         </div>
        
// <!--------------------------More details when clicked on a portfolio------>
//         <div id="etf_detail" class="row" style="display:none;">
//           <div class="col-md-3">
//           </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
//           <br><br><span style="color:grey">
//           ----> Here --- how many friends have invested or smth</span></div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
//         </div>
//       </a>
      
// <!-------------------------------->
        
//       <a href="#" id="etf" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px;border-top-style:solid; border-top-color:black; border-top-width:thin">
//         <div class="row">
//           <div class="col-md-3">
//           <div style="height:140;border:0px solid #000">
//           <img src="/assets/SPDR.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:10px;margin-bottom:10px">
//           </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Wall Street Companies</h3><small class="text-muted">Underlying Asset: Financial Select Sector SPDR Fund</small>
//           </div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:green">0.27%</h2><br><button id="investbtn" type="button" class="btn btn-success btn-lg">Invest</button></div>
//         </div>
//       <div id="etf_detail" class="row" style="display:none;">
//           <div class="col-md-3">
//           </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
//           <br><br><span style="color:grey">
//           ----> Here --- how many friends have invested or smth</span></div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
//         </div>
//       </a>
      
//       <a href="#" id="etf" class="list-group-item clearfix list-group-item-action align-items-start"  style="border-radius:0px">
//         <div class="row">
//           <div class="col-md-3">
//           <div style="height:140;border:0px solid #000">
//           <img src="/assets/ishares_logo.jpg" class="img img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:30px;margin-bottom:10px">
//           </div></div><!----><div class="col-md-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Oil and Gas companies</h3><small class="text-muted">Underlying Asset: U.S. Oil & Gas Exploration & Production ETF</small>
//           </div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"><h2 style="color:red">-1.39%</h2><br><button type="button" id="investbtn" class="btn btn-success btn-lg">Invest</button></div>
//         </div>
//         <div id="etf_detail" class="row" style="display:none;">
//           <div class="col-md-3">
//           </div><!----><div class="col-md-7 vcenter"><div style="height:80;border:0px solid #F00"><h4 style="color:green">Details:</h4><br>Imagine all the tech companies in the United States. This portfolio represents little portion of each of them. Apple, Amazon and Google and all of them.
//           <br><br><span style="color:grey">
//           ----> Here --- how many friends have invested or smth</span></div>
//           </div><!----><div class="col-md-2" style="margin-top:20px;text-align:right"></div>
//         </div>
//       </a>
//     </div>
    
//   <!------------ End Portfolio Listings------------->  
    
// 	</div>`
}
  
 const getTenPortflios = ()=>{
                $.ajax({
            type: 'get',
            url: `/portfolios/ten_portfolios.json`,
            dataType: 'json'
          }).done(function(data) {
            var listing = etfList(data);
            fader(listing, '.main-dashboard');
            $('.box p').replaceWith(`<p>I never quite understood all the apps that don't explain you finance. How can you invest if you do not have a clue what you are doing. We have made some basic cards for you that help you understand and learn finance. And its not for 'hedge Fund' kids, its for everyone</p>`)
          });
} 

function fader(content, location){
           $(location).fadeOut("normal",function(){
           var div = $(location).hide();
           $(this).replaceWith((content));
           $(location).fadeIn("normal");
         })
}

function clickSocial(){
    $(document).on('click',"#social-tab",function(ev){
        ev.preventDefault();
        fader(socialContent, '.main-dashboard');
    $('.box p').replaceWith(`<p>This is the coolest thing in our app. We believe that you will get far when surrounded by your friends</p>`)
 
    })
    
}

function clickAmount(){
  $(document).on('click', '#amount', function(ev){
    ev.preventDefault();
     $('.box p').replaceWith(`<p>Would you really invest $100,000 in the next 5 years? I wouldn't, and probably you wouldn't too, so $10 is what I would really start with, and you get 10$ to invest. Guess what, even it is a virtual money, you gotta earn it. Click on it to see how you can do it. </p>`)
  })
}

function clickDashBoard(){
    $(document).on('click',"#dashboard-tab",function(ev){
         ev.preventDefault();
          fader(mainDashBoardContent, '.main-dashboard');
    });
}

function clickKnowledge(){
  $(document).on('click',"#knowledge-tab",function(ev){
    ev.preventDefault();
    fader(knowledgeContent,'.main-dashboard');
  })
}

function clickExperience(){
  $(document).on('click',"#experience-tab",function(ev){
    ev.preventDefault();
     getTenPortflios();
  })
}

const everyone = (data, d)=>{
  return `<div id="people" class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;">
  ${data.map( person=> 
    `<a href="#" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px">
    <div class="row">
      <div class="col-sm-3"><div style="height:140;border:0px solid #000">
      <img src="/assets/Rashidprofile.jpg" class="img-circle img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
      </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>${person.name} chipped in ${person.last_portfolio_name}</h3><small class="text-muted">${new Date().getDay(person.investment_date)} days ago</small> </div>
      </div><!----><div class="col-md-2" style="margin-top:90px"><button type="button" class="btn btn-success btn-lg" style="position: absolute; right: 10px;">Chip in</button></div>
      </div>
     </a>`
    )
  }
   </div>
  `
}

function everyoneBtn(){
    var d = new Date();
    var n = d.getTime();
    $(document).on('click',"#everyonebtn",function(ev){
        ev.preventDefault();
              $.ajax({
            type: 'post',
            url: `/users/social.json`,
            dataType: 'json',
            data: {"choice": "everyone"}
          }).done(function(data) {
            debugger;
             var result = data.slice(data.length-20,data.length)
             fader(everyone(result, d),"#people");
          });
          
    })
}

function friendsBtn(){
  var friends= `<div id="people" class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;">
  <a href="#" class="list-group-item clearfix list-group-item-action align-items-start" style="border-radius:0px">
    <div class="row">
      <div class="col-sm-3"><div style="height:140;border:0px solid #000">
      <img src="/assets/Isuruprofile.jpg" class="img-circle img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
      </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Bob chipped in SPYDR POOP index</h3><small class="text-muted">3 days ago</small> </div>
      </div><!----><div class="col-md-2" style="margin-top:90px"><button type="button" class="btn btn-success btn-lg" style="position: absolute; right: 10px;">Chip in</button></div>
      </div>
     </a>
     </div>`
     
      $(document).on('click',"#friendsbtn",function(ev){
        ev.preventDefault();
        fader(friends,"#people");
    })
}

function scoreBoardBtn(){
  var scoreboard = `<div id="people" class="list-group" style="font-family:'Roboto'; font-size:14px; color:#666666;">
 <a href="#" class="list-group-item clearfix list-group-item-action flex-column align-items-start" style="border-radius:0px">
<div class="row">
  <div class="col-sm-3"><div style="height:140;border:0px solid #000"><img src="/assets/Rashidprofile.jpg" class="img-circle img-fluid" alt="Cinque Terre" width="100" height-max="100" style="margin-top:20px">
  </div></div><!----><div class="col-sm-7 vcenter" style="margin-top:30px"><div style="height:80;border:0px solid #F00"><h3>Trump chipped in The Wall Fund</h3><small class="text-muted">3 days ago</small> </div></div>
  <div class="col-md-2" style="margin-top:90px"><button type="button" class="btn btn-success btn-lg" style="position: absolute; right: 10px;">Chip in</button></div>
  </div>
</a>
  </div>`
      $(document).on('click',"#scoreboardbtn",function(ev){
        ev.preventDefault();
        fader(scoreboard,"#people");
    })
}

const onClickETF = ()=>{
  $(document).on('click','#etf', (ev)=>{
    ev.preventDefault();
    const childDiv = $(ev.currentTarget).context.lastElementChild;
    // debugger;
    if ($(childDiv).is(':visible')){
      $(childDiv).slideUp();
    }else{
      $(childDiv).slideDown();
    }
  })
}

const openModal = ()=>{
  let signInCount = parseInt($('#sign_in_count').val());
  if (signInCount <= 1 && window.localStorage.count !="1"){
    $('#myModal').modal('toggle');
    window.localStorage.count="1";
  }
}
const updateInfo = ()=>{
        $(document).on('click','#update_user_info',(ev)=>{
        let name = $('#myModal #recipient-name').val();
        let email = $('#myModal #recipient-email').val();
        let phone = $('#myModal #recipient-phone').val();
         $.ajax({
            type: 'post',
            url: `/users/update`,
            dataType: 'json',
            data: {
              "user":{
              "name": name,
              "email": email,
              "phone": phone
            }
              
            }
          }).done(function(data) {
            alert("Info updated!")
             $('#myModal').modal('toggle');
             location.reload();
          });
  })
}
var counter = 0;
const clickNext = () =>{
  $(document).on('click', '#next', (ev)=>{
    ev.preventDefault(); 
    if(counter == 0){
       $('.box p').replaceWith(`<p>We think starting is already a big step forward, so we give you 3% in each skill. Hooray! </p>`)
       counter +=1;
       window.localStorage.box=1;
    }else if(counter == 1){
      $('.box p').replaceWith(`<p>Check the app and see where everything is located (each of the tasks is linked to a particular skill, you can see it by pointing on the feature it will show you what skill that feature increases)</p>`)
      counter +=1;
      window.localStorage.box=2;
    }else if(counter ==2){
       $('.box p').replaceWith(`<p>So lets just kick it. Ive created few tasks for you, as you finish them you will get to the second level and get more perks opened for you</p>`)
    }
  })
}

const defaultBox = () =>{
      if(window.localStorage.box == 0){
       $('.box p').replaceWith(`<p>We think starting is already a big step forward, so we give you 3% in each skill. Hooray! </p>`)
    }else if(window.localStorage.box == 1){
      $('.box p').replaceWith(`<p>Check the app and see where everything is located (each of the tasks is linked to a particular skill, you can see it by pointing on the feature it will show you what skill that feature increases)</p>`)
    }else if(window.localStorage.box ==2){
       $('.box p').replaceWith(`<p>So lets just kick it. Ive created few tasks for you, as you finish them you will get to the second level and get more perks opened for you</p>`)
    }
}

const sliderIntro = ()=>{
		jQuery(document).ready(function($) {
			$('.my-slider').unslider();
		});
}

const sliderNext = ()=>{
  $(document).on('click','#nextBtnSlider',(ev)=>{
    ev.preventDefault();
      $('.my-slider').unslider('next');
  })
}



const clickInvest = ()=>{
  $(document).on('click','#investbtn',(ev)=>{
    ev.preventDefault();
    let etfId = $($(ev.target.parentElement).context.childNodes[2]).val();
    let etfName = $($(ev.target.parentElement).context.childNodes[3]).val();
    $("#modalETFName").append(etfName);
    $("#etfID").val(etfId);
    // debugger;
    $('#investModal').modal('toggle');
  })
}

const submitInvest = ()=>{
  $(document).on('click', "#makeInvestment", (ev)=>{
    ev.preventDefault();
    let investmentAmount = $("#amountInvested").val()
    let portfolioId = $('#etfID').val();
             $.ajax({
            type: 'post',
            url: `/user_portfolios`,
            dataType: 'json',
            data: {
              "investment_amount": investmentAmount,
              "portfolio_id": portfolioId
            }
          }).done(function(data) {
            alert("Investment Made!")
             location.reload();
          });
  })
}
const messageFormat = (input)=>{
  return `                <li class="left clearfix" style="padding:0px">
                <div class="chat-body clearfix" style="padding:0px">
                <div class="header">
                <strong class="primary-font" style="color:rgba(51, 153, 204, 1)">Richie</strong> <small class="pull-right text-muted">
                <span class="glyphicon glyphicon-time"></span>14 mins ago</small>
                </div>
                        <p>
                            ${input}
                        </p>
                </div>
                </li>`
}

const userMessageFormat = (input, name)=>{
  return `                <li class="right clearfix" style="padding:0px">
                <div class="chat-body clearfix" style="padding:0px">
                <div class="header">
                <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>10 mins ago</small>
                <strong class="pull-right primary-font" style="color:rgba(51, 153, 204, 1)">${name}</strong>
                </div>
                     <p>
                        ${input}
                     </p>
                </div>
                </li>`
}

const ibmBlueMixSendMesssage = ()=>{
  $(document).on('submit','#watson',(ev)=>{
      ev.preventDefault();
    // debugger;
    let message = $('input#user-input').val();
     $('ul.chat').append(userMessageFormat(message, $('#username').val()));
       $('input#user-input').val('');
   $.ajax
    ({
       type: "POST",
        dataType: 'json',
        url: "/user_portfolios/watson_proxy.json",
        data: {"insert":{ "input": {"text": message } }}
    }).done(function(data) {
          $('ul.chat').append(messageFormat(data.output.text[0]));
          $("#chatBox").animate({ scrollTop: $(document).height() }, "slow");
          });
    
  });

}

  // $.ajax
  //   ({
  //     type: "POST",
  //       contentType: 'application/json',
  //       dataType: 'json',
  //       username: 'fcd45e5b-e1d8-42ea-8b1e-51b506b5d9dd',
  //       password: 'gU37Hs0zV7ti',
  //       url: "https://gateway.watsonplatform.net/conversation/api/v1/workspaces/6b52eac7-5172-4546-8d84-cf5a0adf659c/message?version=2017-02-03",
  //       data: { "input": {"text": message } }
  //   }).done(function(data) {
  //         debugger;
  //         });
    
  // });

$(document).ready(function(){
    clickSocial();
    clickDashBoard();
    friendsBtn();
    scoreBoardBtn();
    everyoneBtn();
    clickKnowledge();
    clickExperience();
    onClickETF();
    updateInfo();
    openModal();
    clickAmount();
    clickNext();
     defaultBox();
     sliderIntro();
     sliderNext();
     clickInvest();
     submitInvest();
     ibmBlueMixSendMesssage();
})

