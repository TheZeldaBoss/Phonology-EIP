using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App1.Models;

namespace App1.Services
{
    public class MainMenuDataStore : IDataStore<Item>
    {
        List<Item> mainMenuItems;
        public MainMenuDataStore()
        {
            mainMenuItems = new List<Item>();
            var mockItems = new List<Item>
            {
                new Item { Id = Guid.NewGuid().ToString(), Text = "Modules de Découverte", Description="" },
                new Item { Id = Guid.NewGuid().ToString(), Text = "Modules de Controle", Description="" },
            };

            foreach (var item in mockItems)
            {
                mainMenuItems.Add(item);
            }

        }

        public async Task<bool> AddItemAsync(Item item)
        {
            mainMenuItems.Add(item);

            return await Task.FromResult(true);
        }

        public async Task<bool> UpdateItemAsync(Item item)
        {
            var oldItem = mainMenuItems.Where((Item arg) => arg.Id == item.Id).FirstOrDefault();
            mainMenuItems.Remove(oldItem);
            mainMenuItems.Add(item);

            return await Task.FromResult(true);
        }

        public async Task<bool> DeleteItemAsync(string id)
        {
            var oldItem = mainMenuItems.Where((Item arg) => arg.Id == id).FirstOrDefault();
            mainMenuItems.Remove(oldItem);

            return await Task.FromResult(true);
        }

        public async Task<Item> GetItemAsync(string id)
        {
            return await Task.FromResult(mainMenuItems.FirstOrDefault(s => s.Id == id));
        }

        public async Task<IEnumerable<Item>> GetItemsAsync(bool forceRefresh = false)
        {
            return await Task.FromResult(mainMenuItems);
        }
        public async Task<IEnumerable<Item>> GetDiscoveryModulesAsync(bool forceRefresh = false)
        {
            return await Task.FromResult(mainMenuItems);
        }
        public async Task<IEnumerable<Item>> GetControlModulesAsync(bool forceRefresh = false)
        {
            return await Task.FromResult(mainMenuItems);
        }
    }
}