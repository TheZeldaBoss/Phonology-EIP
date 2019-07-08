using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App1.Models;

namespace App1.Services
{
    public class ControlModulesDataStore : IDataStore<Item>
    {
        List<Item> controlModulesItems;
        public ControlModulesDataStore()
        {
            controlModulesItems = new List<Item>();
            var mockItems = new List<Item>
            {
                new Item { Id = Guid.NewGuid().ToString(), Text = "Fréquence Fondamentale", Description = "Modifier la fréquence de sa voix pour avancer" },
                new Item { Id = Guid.NewGuid().ToString(), Text = "Voisement", Description = "Tenir un son voisé pour refaire un parcours" },
                new Item { Id = Guid.NewGuid().ToString(), Text = "Phonèmes et mots", Description = "Travailler les phonèmes et la prononciation" },
            };

            foreach (var item in mockItems)
            {
                controlModulesItems.Add(item);
            }

        }

        public async Task<bool> AddItemAsync(Item item)
        {
            controlModulesItems.Add(item);

            return await Task.FromResult(true);
        }

        public async Task<bool> UpdateItemAsync(Item item)
        {
            var oldItem = controlModulesItems.Where((Item arg) => arg.Id == item.Id).FirstOrDefault();
            controlModulesItems.Remove(oldItem);
            controlModulesItems.Add(item);

            return await Task.FromResult(true);
        }

        public async Task<bool> DeleteItemAsync(string id)
        {
            var oldItem = controlModulesItems.Where((Item arg) => arg.Id == id).FirstOrDefault();
            controlModulesItems.Remove(oldItem);

            return await Task.FromResult(true);
        }

        public async Task<Item> GetItemAsync(string id)
        {
            return await Task.FromResult(controlModulesItems.FirstOrDefault(s => s.Id == id));
        }

        public async Task<IEnumerable<Item>> GetItemsAsync(bool forceRefresh = false)
        {
            return await Task.FromResult(controlModulesItems);
        }
        
    }
}