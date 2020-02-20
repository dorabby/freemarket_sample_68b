$(document).on('turbolinks:load', function() {
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"><br>
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4];
  
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
    
  

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    $(`img[data-index="${targetIndex}"]`).remove();
  });

});


//以下カテゴリ
// $(document).on('turbolinks:load', function() {
//   $(function(){
//     function appendOption(category){
//       var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
//       return html;
//     }
//     // 子カテゴリーを表示するビュー
//     function appendChidrenBox(insertHTML){
//       var childSelectHtml = '';
//       childSelectHtml = `<select name='item[child_category_id]' class="select-default" id="child-form" required>
//                               <option label="---" data-category="---"></option>
//                               ${insertHTML}
//                             </select>`
//       $('#category').append(childSelectHtml);
//     }
//     // 孫カテゴリーを表示するビュー
//     function appendGrandchidrenBox(insertHTML){
//       var grandchildSelectHtml = '';
//       grandchildSelectHtml = `<select name='item[category_id]' class="select-default" id="grandchild-form" required>
//                                   <option label="---" data-category="---"></option>
//                                   ${insertHTML}
//                                 </select>`;
//       $('#category').append(grandchildSelectHtml);
//     }
//     // 親カテゴリー選択のイベント
//     $('#parent-form').on('change', function(){
//       var parentCategory = $('option:selected',this).val();
//       if (parentCategory != "---"){
//         $.ajax({
//           url: '/items/get_category_children',
//           type: 'GET',
//           data: { parent_id: parentCategory },
//           dataType: 'json'
//         })
//         .done(function(children){
//           $('#child-form').remove();
//           $('#grandchild-form').remove();
//           var insertHTML = '';
//           children.forEach(function(child){
            
//             insertHTML += appendOption(child);
//           });
//           appendChidrenBox(insertHTML);
//         })
//         .fail(function(){
//           alert('カテゴリー取得に失敗しました');
//         })
//       }else{
//         $('#child-form').remove();
//         $('#grandchild-form').remove();
//       }
//     });
//     // 子カテゴリー選択後のイベント
//     $('#category').on('change', "#child-form",function(){
//       var childId = $('option:selected',this).val();
//       if (childId != "---"){
//         $.ajax({
//           url: '/items/get_category_grandchildren',
//           type: 'GET',
//           data: { child_id: childId },
//           dataType: 'json'
//         })
//         .done(function(grandchildren){
//           if (grandchildren.length != 0) {
//             $('#grandchild-form').remove();
//             var insertHTML = '';
//             grandchildren.forEach(function(grandchild){
//               insertHTML += appendOption(grandchild);
//             });
            
//             appendGrandchidrenBox(insertHTML);
//           }
//         })
//         .fail(function(){
//           alert('カテゴリー取得に失敗しました');
//         })
//       }else{
//         $('#grandchild-form').remove();
//       }
//     });
//   });
// });