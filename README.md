# external-linkage

[![debug test](https://github.com/yusuke-takatsu/external-linkage/actions/workflows/testing.yml/badge.svg)](https://github.com/yusuke-takatsu/external-linkage/actions/workflows/testing.yml)

外部APIサーバーは、外部リポジトリと連携するために設計された Laravel ベースのバックエンドサービスです。本リポジトリは、一つのドメインロジックとデータベース（「external」データベース）を扱い、外部リポジトリのマイグレーションとデータは別のデータベースで管理されます。
これらのサービス間の統合は、共有ネットワークと明示的なデータベース設定を通じて実現されます。

> **注意：**  
> 本リポジトリは外部のプライベートリポジトリと連携するように設定されています。そのため、GitHub Actions 内で Deploy Keys または GithubApps を使用し、これらのリポジトリから安全にコードを取得して実行します。
