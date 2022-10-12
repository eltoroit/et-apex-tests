echo "Test Demo"
git checkout start
./@ELTOROIT/CreateScratchOrg.sh
./@ELTOROIT/TestDemo.sh start
./@ELTOROIT/TestDemo.sh D1
./@ELTOROIT/TestDemo.sh D1a
./@ELTOROIT/TestDemo.sh D1b
./@ELTOROIT/TestDemo.sh D1c
./@ELTOROIT/TestDemo.sh D2
./@ELTOROIT/TestDemo.sh D2a
./@ELTOROIT/TestDemo.sh D2b
./@ELTOROIT/TestDemo.sh D2c
./@ELTOROIT/TestDemo.sh D2d
./@ELTOROIT/TestDemo.sh D2e
./@ELTOROIT/TestDemo.sh D3
./@ELTOROIT/TestDemo.sh D3a
./@ELTOROIT/TestDemo.sh D3b

echo "Get it ready"
./@ELTOROIT/Demo.sh start
