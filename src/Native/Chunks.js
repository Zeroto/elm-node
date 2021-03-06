var make = function make(localRuntime) {
    return (function () {
        foreign.sanitize(localRuntime, 'Native', 'Chunks');
        return localRuntime.Native.Chunks.values ? localRuntime.Native.Chunks.values : localRuntime.Native.Chunks.values = {
            'emptyBuffer': new Buffer([]),
            'marshall': F3(function (Left, Right, chunk) {
                return typeof(chunk) == 'string' ? Left(chunks) : Right(chunk);
            })
        };
    })();
};
foreign.sanitize(Elm, 'Native', 'Chunks');
Elm.Native.Chunks.make = make;