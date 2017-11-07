<!DOCTYPE html>
<html lang="en">
<head>
<title>file-upload</title>


<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
<script
	src="<%=request.getContextPath()%>/static/js/lib/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/static/js/lib/bootstrap.min.js"></script>

<link href="<%=request.getContextPath()%>/static/plugins/fileinput/css/fileinput.min.css" media="all" rel="stylesheet"
	type="text/css" />

<script src="<%=request.getContextPath()%>/static/plugins/fileinput/js/plugins/canvas-to-blob.min.js"
	type="text/javascript"></script>
<!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview.
     This must be loaded before fileinput.min.js -->
<script src="<%=request.getContextPath()%>/static/plugins/fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>
<!-- purify.min.js is only needed if you wish to purify HTML content in your preview for HTML files.
     This must be loaded before fileinput.min.js -->
<script src="<%=request.getContextPath()%>/static/plugins/fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
<!-- the main fileinput plugin file -->
<script src="<%=request.getContextPath()%>/static/plugins/fileinput/js/fileinput.min.js"></script>
<!-- bootstrap.js below is needed if you wish to zoom and view file content 
     in a larger detailed modal dialog -->
<script src="<%=request.getContextPath()%>/static/plugins/fileinput/themes/fa/theme.js"></script>
<!-- optionally if you need translation for your language then include 
    locale file as mentioned below -->
<script src="<%=request.getContextPath()%>/static/plugins/fileinput/js/locales/zh.js"></script>
<style>
#uploadsection{
   width:800px;
   margin-left:100px;
}
</style>
<script>
	$(document).on('ready', function() {
		$("#fileupload").fileinput({
			uploadUrl : 'https://fs.chime.me/doc/upload',
			maxFilePreviewSize : 10240,
                        maxFileCount: 3,
                        uploadExtraData : {business:"test-doc-upload"}
		}).on('filebatchpreupload', function(event, data, id, index) {
    			$('#kv-success-1').html('<h4>Upload Success</h4><ul></ul>').hide();
		}).on('fileuploaded', function(event, data, id, index) {
                var fname = data.files[index].name,
        		out = '<li>'+ fname+':'+ '<a href='+data.response.data["url"]+'>'+data.response.data["url"]+' </a></li>'  
    			$('#kv-success-1 ul').append(out);
    			$('#kv-success-1').fadeIn('slow');
		});
	});
</script>
</head>
<body>
<section id="uploadsection">
<label class="control-label">Select File</label>
<input id="fileupload" name="data" type="file" multiple
	class="file-loading">
<div id="errorBlock" class="help-block"></div>
<div id="kv-success-1" class="alert alert-success fade in" style="margin-top:10px;display:none"></div>
</section>
</body>
