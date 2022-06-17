<script>
	import Nav from './nav.svelte';
	import Logo from './logo.svelte';
	import AnimationButton from './animationsToggle.svelte';
	import CollabTicker from './ticker.svelte';
	// stub data out
	const navItems = [
		{
			name: 'ARTISTS',
			href: '/artists'
		},
		{
			name: 'LABELS',
			href: '/labels'
		},
		{
			name: 'RECORDS',
			href: '/records'
		}
	];
</script>

<header>
	<Logo />
	<Nav {navItems} />
	<AnimationButton />
	<CollabTicker />
</header>

<style>
	header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin: 0 40px;
		height: 88px;
		border-bottom: solid 1px var(--white);
		user-select: none;
	}
</style>
