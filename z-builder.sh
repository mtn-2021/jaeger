make build-ui
cd jaeger-ui
npm run build
cd ..
esc -pkg assets -o cmd/query/app/ui/actual/gen_assets.go -prefix jaeger-ui/packages/jaeger-ui/build jaeger-ui/packages/jaeger-ui/build
