%let panelcolumns = 4;
%let panelborder = 4;
ods tagsets.htmlpanel file="C:\bypanel2.html" gpath='c:\' options(doc='help');
goptions device=java xpixels=320 ypixels=240;
title1 'Product Reports' ;
footnote1 ;
proc summary data=sashelp.shoes nway ;
  class region product ;
  var stores sales inventory returns ;
  output out=sum sum= mean= /autolabel autoname ;
run ;
proc gchart data=sum ;
  by region ;
  vbar product / sumvar=sales_sum pattid=midpoint discrete ;
run;
quit;
proc summary data=sashelp.shoes nway ;
  class region subsidiary ;
  var stores sales inventory returns ;
  output out=sum sum= mean= /autolabel autoname ;
run ;
%let panelcolumns = 5;
%let panelborder = 1;
ods tagsets.htmlpanel ;
title 'Summary data' ;
proc print data=sum ;
run ;
title 'Subsidiary Reports' ;
%let panelcolumns = 5;
%let panelborder = 1;
ods tagsets.htmlpanel ;
goptions dev=java xpixels=160 ypixels=120;
proc gchart data=sum ;
  by region ;
  pie subsidiary / sumvar=sales_sum discrete ;
run;
quit;
ods _all_ close;