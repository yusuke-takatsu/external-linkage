# external-linkage

[![Build Status](https://img.shields.io/github/actions/workflow/status/your-org/external-api-server/ci.yml)](https://github.com/your-org/external-api-server/actions)
[![License](https://img.shields.io/github/license/your-org/external-api-server)](LICENSE)

外部APIサーバーは、外部リポジトリと連携するために設計された Laravel ベースのバックエンドサービスです。本リポジトリは、一つのドメインロジックとデータベース（「external」データベース）を扱い、外部リポジトリのマイグレーションとデータは別のデータベースで管理されます。
これらのサービス間の統合は、共有ネットワークと明示的なデータベース設定を通じて実現されます。

> **注意：**  
> 本リポジトリは外部のプライベートリポジトリと連携するように設定されています。そのため、GitHub Actions 内で Deploy Keys または GithubApps を使用し、これらのリポジトリから安全にコードを取得して実行します。
