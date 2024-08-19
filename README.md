This project is a demo about testing JAX-RS RESTful apis.
Api tests with playwright can be run as followed.
    1. Open plawright folder(test/playwright) in terminal
    2. Then: npx playwright test

Api tests with Robot Framework can be run as followed.
    1. Open robot-framework folder in terminal.
    2. On terminal : python -m venv venv
    3. Then: source venv/bin/activate
    4. Then: pip install -r ./requirements.txt
    5. then: robot ./tests/testSuite1.robot
    Steps 2 and 4 only have do once.



# jaxrs-demo-2.x [![Build Status][travis-img]][travis]

JAX-RS 2.x demo using Jersey (JSR 370)

Module | Description
:----- | :-----
`quickstart` | [A simple REST demo with JAX-RS][1]
`http-methods` | [HTTP Methods in JAX-RS][2]
`jaxrs-params` | [JAX-RS Parameter Annotations][3]
`exception` | [Exception Handling][4]
`async` | [Asynchronous Processing][5]

[1]: https://mincong.io/2018/11/13/simple-rest-demo-with-jax-rs/
[2]: https://mincong.io/2018/11/20/http-methods-in-jax-rs/
[3]: https://mincong.io/2018/11/27/jax-rs-parameters/
[4]: https://mincong.io/2018/12/03/exception-handling-in-jax-rs/
[5]: https://mincong.io/2020/03/15/jaxrs-async-processing/
[travis]: https://travis-ci.org/mincong-h/jaxrs-2.x-demo
[travis-img]: https://travis-ci.org/mincong-h/jaxrs-2.x-demo.svg?branch=master


