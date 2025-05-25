import ExtensionCard from "../../components/extension_card";
import { useLibrary } from "../../libraryContext";

export default function RequestsList() {
	const { moderBooks } = useLibrary()

	return (
		moderBooks!.filter(book => book.extension_request || book.wishlist.length > 0).map((book, index) => (
			<div>
				<ExtensionCard key={index} bookInfo={book} />
			</div>
		))
	)
}
