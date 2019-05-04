$(document).ready(function () {
        var video = document.getElementById('camera');
        var canvas = document.getElementById('canvas');
        var context = canvas.getContext('2d');

        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {

            // Compare the photographed image to the current Rekognition collection
            var attend = function () {
                context.drawImage(video, 0, 0, 640, 480);
                $.post({
                    url: '/new_attendance',
                    data: {
                        image: canvas.toDataURL("image/png").replace("image/png", "image/octet-stream")
                    },
                    success: function (response) {
                        // alert(response)
                    },
                    failed: function() {

                    }
                });
            };

            $("#attend").click(attend);

            // Initiate the camera widget on screen
        }
        navigator.mediaDevices.getUserMedia({video: true}).then(function (stream) {
            video.srcObject = stream;
            video.play();
            $('#loading_img').hide();
        }).catch(function () {
            alert('Error when capturing video from camera')
        });
    }
);
