$(document).ready(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group2">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][image]"
                    id="item_images_attributes_${num}_src"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class='preview-files'>
                    <div class='preview-file'>
                      <img data-index="${index}" src="${url}" class="preview-file-img">
                    </div>
                    <div data-index="${index}" class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    var count = $('.preview-file-img').length;
    var abcde = $('#dropArea')
    if (count == 4) {
      abcde.fadeOut();
    }
  });

  $('.js-file_group:first').on('click', function() {
    $('.js-file:last').trigger('click');
    return false;
  });

  

  //画像削除した時の処理//
  $('#image-box').on('click', '.js-remove', function() {

    $(this).parent().remove();

    var number = Number($(this).data('index'));
    
    const file_field_btn = $(`#item_images_attributes_${number}_src`);
    if(file_field_btn) file_field_btn.remove(); 

    var count = $('.preview-file-img').length;
    var abcde = $('#dropArea')
    if (count == 3) {
      abcde.show();
    }
    
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
