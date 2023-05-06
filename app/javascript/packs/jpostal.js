$(function () {
    return $('#user_postal_code').jpostal({
        postcode: ['#user_postal_code'],
        address: {
            '#user_prefecture_code': '%3',
            '#user_address': '%4%5%6%7',
        },
    });
});