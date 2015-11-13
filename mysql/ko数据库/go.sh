#!/bin/bash
mysqldump --opt -d -uroot -pCQMYG14dss ko_open >> ko.sql;
mysqldump --opt -d -uroot -pCQMYG14dss  ko_user  >> ko.sql;
mysqldump --opt -d -uroot -pCQMYG14dss   ko_battle  >> ko.sql;
mysqldump --opt -d -uroot -pCQMYG14dss    ko_pay  >> ko.sql;
mysqldump --opt -d -uroot -pCQMYG14dss     ko_product  >> ko.sql;
mysqldump --opt -d -uroot -pCQMYG14dss      ko_sns  >> ko.sql;
mysqldump --opt -d -uroot -pCQMYG14dss       ko_stat >> ko.sql;
