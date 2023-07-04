# FootballManagerScouting

This is just a personal project that I made to help simplify my scouting for Football Manager.

I was originally inspired by Zealand's Moneyball script [see YouTube video explaining here](https://www.youtube.com/watch?v=yqIXVjCdYks).
Ffter looking at the data being given, I figured that I could expand on it a bit by adding some forms of visualization to the fold.

As such, after exporting my data into a HTML file from Football Manager, I then converted it into a .csv file. 
From the .csv file, I had used python to convert the file so that I'd be able to open it in PostgreSQL (no particular reason why I did it this way, just was easier to me).
In PostgreSQL, I did some cleaning of the data and renamed/rearranged some data so that it would be more readable.
From there, I went back to Excel after exporting back again to a .csv, and began adding visualizations, mainly through radar charts. 

I found radar charts the easiest to see differences among different facets of an athlete's game, and divided it into 4 sections: attacking, midfield, defensive, and goalkeeping.
All 4 of these have 6 or 7 facets of their own to create 4 radar charts for each facet. 

There are also 2 sheets in the final file other than the raw data, that being a sheet to look up a particular player, and one to compare two players' games.
In both, the player can be looked up by using the drop down menu in the player name section, and the rest will update automatically.

Some screenshots of the visualizations are below.

[Imgur](https://i.imgur.com/hn6v8C0.png)

[Imgur](https://i.imgur.com/mpvW1FZ.png)

This project is only meant to serve as an addition to my portfolio for data analysis to showcase skills in data visualization and Excel in particular. 
