# Generated by repro: do not edit by hand
# Please edit Dockerfiles in .repro/
FROM rocker/verse:4.2.2
ARG BUILD_DATE=2023-01-25
WORKDIR /home/rstudio
RUN apt-get update -y && apt-get install -y rsync
RUN tlmgr install collection-latexrecommended
RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site
RUN install2.r --error --skipinstalled \ 
  here \ 
  lubridate \ 
  tidyverse
RUN installGithub.r \ 
  aaronpeikert/repro@fc7e884
