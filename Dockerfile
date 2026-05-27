FROM golang:alpine AS build
WORKDIR /src
COPY . .
RUN go build -o youtube-mp3-bot

FROM alpine:3.23
RUN apk --no-cache add yt-dlp ffmpeg
WORKDIR /app
COPY --from=build /src/youtube-mp3-bot /app/
ENTRYPOINT ["./youtube-mp3-bot"]
