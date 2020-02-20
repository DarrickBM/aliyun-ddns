﻿
ARG runtime=3.1
ARG version=0

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
LABEL maintainer="sanjusss@qq.com"
WORKDIR /src
COPY . /src
RUN dotnet publish -c Release -o /app --version-suffix=$version ./aliyun-ddns/aliyun-ddns.csproj

FROM mcr.microsoft.com/dotnet/core/runtime:$runtime AS final
LABEL maintainer="sanjusss@qq.com"
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "aliyun-ddns.dll"]
