FROM rocker/verse:3.6.0
MAINTAINER Granville J Matheson mathesong@gmail.com

# Install rstanarm, brms, and friends
RUN install2.r --error --deps TRUE \
        mgcv remotes here  \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
	

# Install JAGs because it's a dependency of agRee
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
  jags

# Install the remote packages
RUN R -e "remotes::install_github('mathesong/kinfitr'); \
          remotes::install_github('mathesong/relfeas'); \
		  remotes::install_github('mathesong/kipettools')"