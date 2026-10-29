FROM ruby:3.2-bookworm

# Native dependencies for Squib (Cairo, Pango, GdkPixbuf, RSVG, Nokogiri)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        pkg-config \
        libcairo2-dev \
        libpango1.0-dev \
        libgdk-pixbuf-2.0-dev \
        libgirepository1.0-dev \
        libglib2.0-dev \
        librsvg2-dev \
        libxml2-dev \
        libxslt1-dev \
        fontconfig \
        fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

# ChunkFive (SIL OFL) is used by the card layouts
ADD --chmod=644 https://raw.githubusercontent.com/theleagueof/chunk/master/ChunkFive-Regular.ttf /usr/local/share/fonts/chunkfive/ChunkFive-Regular.ttf
RUN fc-cache -f && fc-match ChunkFive

WORKDIR /app/src

COPY src/Gemfile ./
RUN bundle install

COPY --chmod=a+rX src/ /app/src/
COPY --chmod=a+rX cards/ /app/cards/
COPY --chmod=a+rX img/ /app/img/

# Output folders are bind-mounted at runtime; _output must be writable for any uid
RUN mkdir -p /app/PDFs-to-print /app/PNGs-to-print /app/src/_output \
    && chmod 777 /app/PDFs-to-print /app/PNGs-to-print /app/src/_output /app/img

ENV HOME=/tmp

# Builds all PDFs and PNGs (see BUILD.md); override with e.g. `rake pdf1all`
CMD ["bundle", "exec", "rake", "all"]
