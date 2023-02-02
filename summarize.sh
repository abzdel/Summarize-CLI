# command line tool - simply calls python script to summarize corpus

# save word hello to sys variable
corpus="""echo
Matthew David Bates (born 10 December 1986) is an English former football manager and former professional footballer, 
as well as holding a UEFA B coaching licence. He is currently the assistant manager at Northern Premier League side Whitby Town.

Bates played for Hartlepool United, Bradford City, Bristol City, Darlington, Ipswich Town, Norwich City and Middlesbrough.


orn in Stockton-on-Tees, County Durham,[1] Bates began playing at Manchester United's centre of excellence in Birtley since the age of nine. 
Several years later, the centre was closed down and he was taken in by his hometown club Middlesbrough. 
After tasting FA Youth Cup success in 2003–04, he was promoted to the first team and made his debut on 6 December 2004, 
coming on as an injury time replacement for Jimmy Floyd Hasselbaink in a 3–2 win over Manchester City. After a successful loan spell at Darlington, 
he made a breakthrough, making 28 appearances and played alongside former manager Gareth Southgate in central defence.[2]

Bates had been tipped by some to be Southgate's successor but an injury while on loan at Ipswich in November 2006 prematurely ended his 2006–07 season. 
He was seriously injured in his second game, tearing his cruciate ligament and partially tearing his medial collateral ligament, and returned to Boro.[3] 
After recovering in January 2008, Bates moved on loan to Norwich City for two months. He later returned to Middlesbrough 
after suffering from another knee injury which has resulted in him needing an operation for the third time in just 18 months.[4] 
He scored his first league goal for Middlesbrough in a crucial 3–1 win over relegation rivals Hull on 11 April 2009.[5]

"""

echo $corpus| python api_caller.py # From the shell