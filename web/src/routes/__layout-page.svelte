<script>
	import '../app.css';
	import { onMount } from 'svelte';
	import { page } from '$app/stores';

	import Header from '$lib/components/header/header.svelte';
	import Footer from '$lib/components/footer/footer.svelte';
	import NavStrip from '$lib/components/common/navStrip.svelte';

	// important for accessibility
	if (import.meta.env.DEV) {
		onMount(() =>
			import('https://unpkg.com/agnostic-axe@3').then(({ AxeObserver, logViolations }) => {
				const MyAxeObserver = new AxeObserver(logViolations);
				MyAxeObserver.observe(document);
			})
		);
	}
</script>

<Header />
<main>
	<slot />
</main>
{#key $page.url.pathname}
	<NavStrip />
{/key}
<Footer />

<style>
	main {
		margin: 40px;
	}
</style>
