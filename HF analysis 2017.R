#Intervention/outcome analysis
#2018-02-15 ML & GD

#Heart failure diagnosis, all ages, all payers
#January 2017 - December 2017
#Intervention / outcome

#Inpatient orderset utilization / mortality
iporderset.mortality = matrix(c(49,36,2691,1248),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#ED orderset utilization / mortality
edorderset.mortality = matrix(c(18,38,1113,2181),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#ED and IP orderset utilization / mortality 
ediporderset.mortality = matrix(c(14,41,949,2346),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#ED and IP orderset utilization / readmissions
ediporderset.readmissions = matrix(c(182,446,781,1941),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#Follow up appointment / readmissions
fua.readmissions = matrix(c(160,100,648,372),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#Follow up phone call / readmissions
fupc.readmissions = matrix(c(179,80,760,261),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#Follow up appointment and follow up phone call / readmissions
fuafupc.readmissions = matrix(c(125,136,539,480),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#Inpatient orderset / readmissions
ip.readmissions = matrix(c(507,256,2233,1028),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#Inpatient orderset, follow up appointment, and follow up phone call / readmissions
ipfuafupc.readmissions = matrix(c(107,183,578,647),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

#ED orderset, inpatient orderset, follow up appointment, and follow up phone call / readmissions
edipfuafupc.readmissions = matrix(c(49,579,270,2542),2,2,dimnames=list(c("Intervention +","Intervention -"),c("Outcome +","Outcome -")))

iporderset.mortality
chisq.test(iporderset.mortality)

edorderset.mortality
chisq.test(edorderset.mortality)

ediporderset.mortality
chisq.test(ediporderset.mortality)

ediporderset.readmissions
chisq.test(ediporderset.readmissions)

fua.readmissions
chisq.test(fua.readmissions)

fupc.readmissions
chisq.test(fupc.readmissions)

fuafupc.readmissions
chisq.test(fuafupc.readmissions)

ip.readmissions
chisq.test(ip.readmissions)

ipfuafupc.readmissions
chisq.test(ipfuafupc.readmissions)

edipfuafupc.readmissions
chisq.test(edipfuafupc.readmissions)

# fisher.test(iporderset.mortality)
# fisher.test(edorderset.mortality)
# fisher.test(ediporderset.mortality)
# fisher.test(ediporderset.readmissions)
# fisher.test(fua.readmissions)
# fisher.test(fupc.readmissions)
# fisher.test(fuafupc.readmissions)
# fisher.test(ipfuafupc.readmissions)
# fisher.test(edipfuafupc.readmissions)