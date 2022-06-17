<script>
	import { page } from '$app/stores';

	let url = $page.url.pathname;
	let map = {
		'/artists': 'labels',
		'/labels': 'records',
		'/records': 'artists'
	};

	let nextUrl = map[url];
</script>

<a href={nextUrl}>
	<section>
		<p class="mono lrg">nächster Raum: //{nextUrl}</p>
	</section>
</a>

<style>
	section {
		height: 64px;
		display: flex;
		align-items: center;
		justify-content: center;
		background: var(--pink);
		color: var(--black);
	}
</style>
