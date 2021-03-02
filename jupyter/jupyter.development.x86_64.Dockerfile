FROM gentoo/portage:latest as portage
FROM gentoo/stage3-amd64:latest as gentoo
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
LABEL maintainer=hello@drewpotter.com

RUN localedef -i en_GB -f UTF-8 en_GB.UTF-8
RUN eselect locale set en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8
RUN . /etc/profile
RUN locale

RUN emerge python dev-python/pip
RUN sudo pip install conda
