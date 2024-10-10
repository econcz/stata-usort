*! version 1.0.0  07oct2024  I I Bolotov
program def usort
	version 15.1
	/*
		This program performs a gsort and adds a sort flag

		Author: Ilya Bolotov, MBA Ph.D.                                         
		Date: 07 October 2024                                                   
	*/
	// perform gsort                                                            
	gsort `*'

	// add a sort flag
	loc varlist  =   ustrregexra(`"`*'"', "[+-]|,.+$", "")
	foreach var  of  varl    `varlist' {
		cap conf str var     `var'
		if _rc   loc num    "`num' `var'"
		else     loc str    "`str' `var'"
	}
	tempname n s
	mata: if ("`num'" != "") `n' =  st_data(.,       tokens("`num'"));      ///
		                           st_store(.,       tokens("`num'"),       ///
		              ((1::st_nobs()) #   J(1,ustrwordcount("`num'"),1)));;
	mata: if ("`str'" != "") `s' = st_sdata(.,       tokens("`str'"));      ///
		                          st_sstore(.,       tokens("`str'"),       ///
		     strofreal((1::st_nobs()) #   J(1,ustrwordcount("`str'"),1)));;
	sort                     `varlist'
	mata: if ("`num'" != "")       st_store(.,       tokens("`num'"), `n');;
	mata: if ("`str'" != "")      st_sstore(.,       tokens("`str'"), `s');;
	****
	      if  "`num'" != ""   mata: mata drop `n'
	      if  "`str'" != ""   mata: mata drop `s'
end
