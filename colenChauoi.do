*Difference Mean ttest 

use 2005-07b.dta, clear  // This is the dataset newly created from merge_data.do
mat T = J(8,4,.)
ttest output, by(taxcode)
mat T[1,1] = r(mu_1)
mat T[1,2] = r(mu_2)
mat T[1,3] = r(mu_1) - r(mu_2)
mat T[1,4] = r(p)

ttest sales, by(taxcode)
mat T[2,1] = r(mu_1)
mat T[2,2] = r(mu_2)
mat T[2,3] = r(mu_1) - r(mu_2)
mat T[2,4] = r(p)

ttest capital, by(taxcode)
mat T[3,1] = r(mu_1)
mat T[3,2] = r(mu_2)
mat T[3,3] = r(mu_1) - r(mu_2)
mat T[3,4] = r(p)

ttest accessroad, by(taxcode)
mat T[4,1] = r(mu_1)
mat T[4,2] = r(mu_2)
mat T[4,3] = r(mu_1) - r(mu_2)
mat T[4,4] = r(p)

ttest accessrail, by(taxcode)
mat T[5,1] = r(mu_1)
mat T[5,2] = r(mu_2)
mat T[5,3] = r(mu_1) - r(mu_2)
mat T[5,4] = r(p)

ttest export, by(taxcode)
mat T[6,1] = r(mu_1)
mat T[6,2] = r(mu_2)
mat T[6,3] = r(mu_1) - r(mu_2)
mat T[6,4] = r(p)

ttest totalasset, by(taxcode)
mat T[7,1] = r(mu_1)
mat T[7,2] = r(mu_2)
mat T[7,3] = r(mu_1) - r(mu_2)
mat T[7,4] = r(p)

ttest totaldebt, by(taxcode)
mat T[8,1] = r(mu_1)
mat T[8,2] = r(mu_2)
mat T[8,3] = r(mu_1) - r(mu_2)
mat T[8,4] = r(p)

mat rownames T = output sales capital accessroad accessrail export totalasset totaldebt
frmttable using ttest.doc, statmat(T) varlabels replace ctitle("",Sample1mean, Sample1mean, Difference "(p-value)")
