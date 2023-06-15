$(function($) {
  $("#close-btn").on("click", function(){
    $("#confirmation-dialog").hide();
  });

  $("#search").on("click", function(){
    const url = "https://www.googleapis.com/books/v1/volumes?q=" + $("#key").val();
    $.ajax({
      url: url,
      dataType: "json"
    }).done(function(data) {
      console.log(data);
      const len = data.items.length;
      let html = "";
      for(let i=0; i<len; i++){
        if(typeof data.items[i].volumeInfo.publisher == "undefined"){
          data.items[i].volumeInfo.publisher = "出版社(不明)";
        }
        let thumbnail = "";
        if (data.items[i].volumeInfo.imageLinks) {
          thumbnail = data.items[i].volumeInfo.imageLinks.smallThumbnail;
        }
        html += `
          <tr>
            <td>${data.items[i].volumeInfo.title}</td>
            <td>${data.items[i].volumeInfo.publisher}</td>
            <td>
              <a target="_blank" href="${data.items[i].volumeInfo.infoLink}">
                <img src="${thumbnail}">
              </a>
            </td>
            <td><button class="selectBook" data-index="${i}">選択</button></td>
          </tr>
        `;
      }
      $("#books").empty().hide().append(html).fadeIn(1000);

      $(".selectBook").on("click", function(){
        const index = $(this).data("index");
        const bookData = {
          title: data.items[index].volumeInfo.title,
          publisher: data.items[index].volumeInfo.publisher,
          image: data.items[index].volumeInfo.imageLinks ? data.items[index].volumeInfo.imageLinks.smallThumbnail : "",
        };

        $("#book_title").val(bookData.title);
        $("#book_publisher").val(bookData.publisher);
        $("#book_image_url").val(bookData.image);

        $("#confirmation-dialog").fadeIn();

        $("#book_form").trigger("submit");
      });
    });
  });
});
