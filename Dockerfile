FROM archlinux

RUN \
  pacman -Syu --noconfirm && \
  pacman -S --noconfirm \
    bind \
    curl \
    inetutils \
    postgresql \
    redis && \
  pacman -Scc --noconfirm

COPY ./keepalive.sh /keepalive.sh
CMD ["/keepalive.sh"]
