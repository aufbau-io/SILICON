<script>
	import Nav from './nav.svelte';
	import Logo from './logo.svelte';
	import Ticker from './ticker.svelte';
	// stub data out
	const navItems = [
		{
			name: 'SANDPIT',
			href: '/'
		},
		{
			name: 'ACCOUNT',
			href: '/ACCOUNT'
		}
	];
</script>

<header>
	<Logo />
	<!--Ticker /-->
	<Nav {navItems} />
</header>

<style>
	header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin: 0 40px;
		height: 50px;
		border-bottom: solid 1px var(--white);
		user-select: none;
	}
</style>
