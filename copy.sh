#!/usr/bin/env bash
cd mywork/aosp
mkdir githubpushable
cp out/target/product/PL2/HyconOS_*.zip githubpushable
cd githubpushable
ls
echo github-release keneankit01/test v2.5 Hycon*.zip
