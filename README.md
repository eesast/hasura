# EESAST Hasura

EESAST Hasura migrations and metadata files

## 开发

[![Build Status](https://travis-ci.com/eesast/hasura.svg?branch=master)](https://travis-ci.com/eesast/hasura)

### 环境

- Node.js npm / yarn: Use hasura-cli to manage
- Docker [Get & Install](https://docs.docker.com/get-docker/)

### 工具

- git
- any terminal or vscode

### 脚本

围绕 Hasura CLI 展开，参看[文档](https://hasura.io/docs/1.0/graphql/core/hasura-cli/index.html)

> 使用 Hasura CLI 启动的 console 页面会记录所有更改，请务必不要使用 docker 自带的 console（`docker-compose.yaml`中已禁用该功能）

#### `apply"`

将仓库中的 migrations 和 metadata 应用在本地 docker 中运行的 Hasura 和 postgres 上

第一次部署 docker 后执行此指令可能会有报错 `FatalError: function \"set_current_timestamp_s with same argument types"`，请先使用 `console`，在其中的 `Data-SQL`处执行 `DROP FUNCTION public.set_current_timestamp_updated_at;`。此方案可能不一定可以解决问题，参看 [hasura/graphql-engine:issues#3633](https://github.com/hasura/graphql-engine/issues/3633)

#### `console`

打开 Hasura console

#### `hasura`

用作执行一般的 hasura-cli 指令，也可以替代另外几个

```
yarn hasura [command] => hasura [command]
```

#### `migrate-squash`

"hasura migrate squash" 的替代，用来将多次改动合并为“一次”

```
hasura migrate squash --name "<feature-name>" --from <start-migration-version>

# note down the version

# mark the squashed migration as applied on this server
hasura migrate apply --version "<squash-migration-version>" --skip-execution
```
