<?php
require($base_path.'vendor/autoload.php');
require($base_path.'propelproject/generated-conf/config.php');
class Books {
        public function booklist(){
                $books = BookQuery::create()->find();
                $book_obj_mapper = function($book){
                        return ['id' => $book->getId(), 'title' => $book->getTitle()];
                };
                echo json_encode(array_map($books, $book_obj_mapper));
        }
        public function book($id, $no_author = false){
                $book_query = new BookQuery();
                $book = $book_query->findPK($id);
                if($no_author){
                        echo json_encode($book);
                }
                else{
                        $author_query = new AuthorQuery();
                        $author = $author_query->findPK($book->getAuthorId());
                        echo json_encode([$book, $author]);
                }
        }
        public function addpublisher($book_id, $publisher_id){
                $bookPublisher = new BookPublisher();
                $bookPublisher->setBookId($book_id);
                $bookPublisher->setPublisherId($book_id);
                $bookPublisher->save();
                echo json_encode(["success" => true]);
        }
}
?>
