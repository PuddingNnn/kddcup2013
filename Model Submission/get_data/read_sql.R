require(RPostgreSQL)
# ���� driver
drv = dbDriver("PostgreSQL")
# ��д������Ϣ
con = dbConnect(drv, dbname = "kdd", 
                user = "postgres", password = "zhuxuening", port = 5432)
# ��ѯ���
#rs = dbSendQuery(con, statement = "select * from paper1000;")
# �ո���
#df = fetch(rs, n = -1)
# ֱ��ִ�в�ѯ���ؽ��
author=dbGetQuery(con, "select * from author;")
paper=dbGetQuery(con, "select * from paper;")
conference=dbGetQuery(con, "select * from conference;")
journal=dbGetQuery(con, "select * from journal;")
paperauthor=dbGetQuery(con, "select * from paperauthor;")
trainconfirmed=dbGetQuery(con, "select * from trainconfirmed;")
traindeleted=dbGetQuery(con, "select * from traindeleted;")
validpaper=dbGetQuery(con, "select * from validpaper;")
# �Ͽ�����
dbDisconnect(con)
# �ͷ���Դ
dbUnloadDriver(drv)

### convert to utf-8 #####

options(stringsAsFactors = FALSE)

Encoding(author$name)="UTF-8"
Encoding(author$affiliation)="UTF-8"

Encoding(paper$title)="UTF-8"
Encoding(paper$keyword)="UTF-8"


Encoding(conference$shortname)="UTF-8"
Encoding(conference$fullname)="UTF-8"
Encoding(conference$homepage)="UTF-8"

Encoding(journal$shortname)="UTF-8"
Encoding(journal$fullname)="UTF-8"
Encoding(journal$homepage)="UTF-8"

Encoding(paperauthor$name)="UTF-8"
Encoding(paperauthor$affiliation)="UTF-8"

author=unique(author)
paper=unique(paper)
conference=unique(conference)
journal=unique(journal)
paperauthor=unique(paperauthor)
trainconfirmed=unique(trainconfirmed)
traindeleted=unique(traindeleted)
validpaper=unique(validpaper)


#set session first
#setwd("~/kdd_data/rda")


save(author,file="author.rda")
save(paper,file="paper.rda")
save(conference,file="conference.rda")
save(journal,file="journal.rda")
save(paperauthor,file="paperauthor.rda")
save(trainconfirmed,file="trainconfirmed.rda")
save(traindeleted,file="traindeleted.rda")
save(validpaper,file="validpaper.rda")

